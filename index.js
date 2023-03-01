const express=require('express');
const mysql=require('mysql');
const cors=require('cors');
const path=require('path');
const multer  = require('multer');

const pool=mysql.createPool({
    host:'localhost',
    user:'root',
    password:'',
    database:'roicomsat',
    connectionLimit:10
})

const app=express();
app.use(cors())
const bodyParser=require('body-parser');
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

const response ={
    status:false,
    message:'',
    data:[]
}

app.use('/assets', express.static('assets'))

app.use(express.static(path.join(__dirname, "assets")));




const multerStorage = multer.diskStorage({
    destination:(req, file, cb)=>{
cb(null, 'assets')
    },
    filename:(req, file, cb)=>{
      
       

        let day=new Date();

        
    
cb(null, ''+req.params.filename)

    }
})

const upload=multer({   
    storage:multerStorage  
})





app.post('/upload/:filename', upload.single('image'), (req, res)=>{
let day=new Date();


    res.send('http://localhost:9000/assets/'+req.params.filename)
})




app.get('/', (req, res)=>{
    res.send('Yes')
})


app.get('/auth', (req, res)=>{
    res.send('Authentication Route')
})


app.post('/auth', (req, res)=>{
    const { email, password}=req.body;
    if( email==="" || email===undefined || password==="" || password===undefined){
        res.send({...response, message:'Email & Password is required'})
    }else{
 
        pool.query("SELECT * FROM students WHERE email='"+email+"' && password='"+password+"'", (error, result, row)=>{
          
            if(error){
                res.send({...response, message:'Error Validating '})
            }else{

            if(result.length>0){
              
                res.send({...response, message:`Welcome ${result[0].first_name} ${result[0].surname}`, status:true, data:result})
            }else{
                res.send({...response, message:'Invalid Login Details '})
            }

            }})

        
    }
})


app.get('/students/:email', (req, res)=>{
    pool.query("SELECT * FROM students WHERE email='"+req.params.email+"'", (error, result, row)=>{
      if(error){

      }else{
        res.send({...response, message:`Student fetched successfully`, status:true, data:result[0]})
      }
    })
})


app.get('/staff/:email', (req, res)=>{
    pool.query("SELECT * FROM staff WHERE email='"+req.params.email+"'", (error, result, row)=>{
      if(error){

      }else{
        res.send({...response, message:`Staff fetched successfully`, status:true, data:result[0]})
      }
    })
})



app.get('/programmes',  (req, res)=>{
    pool.query("SELECT * FROM programmes", (error, result, row)=>{          
        if(error){
            res.send({...response, message:'Error Fetching Programmes '})
        }else{          
            res.send({...response, message:`Programmes fetched successfully`, status:true, data:result})
        }})
})




app.get('/activities',  (req, res)=>{
    pool.query("SELECT * FROM activities", (error, result, row)=>{          
        if(error){
            res.send({...response, message:'Error Fetching Activities '})
        }else{          
            res.send({...response, message:`Activities fetched successfully`, status:true, data:result})
        }})
})

app.get('/students',  (req, res)=>{
    pool.query("SELECT * FROM students", (error, result, row)=>{          
        if(error){
            res.send({...response, message:'Error Fetching Students '})
        }else{          
            res.send({...response, message:`Students fetched successfully`, status:true, data:result})
        }})
})




app.get('/staff',  (req, res)=>{
    pool.query("SELECT * FROM staff", (error, result, row)=>{          
        if(error){
            res.send({...response, message:'Error Fetching staff '})
        }else{          
            res.send({...response, message:`staff fetched successfully`, status:true, data:result})
        }})
})





app.get('/payments',  (req, res)=>{
    pool.query("SELECT * FROM payments", (error, result, row)=>{          
        if(error){
            res.send({...response, message:'Error Fetching payments '})
        }else{          
            res.send({...response, message:`payments fetched successfully`, status:true, data:result})
        }})
})



app.delete('/students/:reg',  (req, res)=>{
    pool.query("DELETE  FROM students WHERE reg_no='"+req.params.reg+"'", (error, result, row)=>{          
        if(error){
            res.send({...response, message:'Error Deleting Students '})
        }else{          
            res.send({...response, message:`Student with ${req.params.reg} Deleted successfully`, status:true, data:result})
        }})
})





app.delete('/staff/:id',  (req, res)=>{
    pool.query("DELETE  FROM staff WHERE id='"+req.params.id+"'", (error, result, row)=>{          
        if(error){
            res.send({...response, message:'Error Deleting staff '})
        }else{          
            res.send({...response, message:`Staff with ${req.params.id} Deleted successfully`, status:true, data:result})
        }})
})





app.get('/payments/:payer',  (req, res)=>{
    let payer=req.params.payer;
    pool.query("SELECT * FROM payments WHERE payer ='"+payer+"'", (error, result, row)=>{
          
        if(error){
            res.send({...response, message:'Error Fetching Payments '})
        }else{
            res.send({...response, message:`Payments fetched successfully`, status:true, data:result})
        }})
})





app.get('/programmes/:id',  (req, res)=>{
    let id=req.params.id;
    pool.query("SELECT * FROM programmes WHERE id ='"+id+"'", (error, result, row)=>{
          
        if(error){
            res.send({...response, message:'Error Fetching programmes '})
        }else{
            res.send({...response, message:`programmes fetched successfully`, status:true, data:result[0]})
        }})
})





app.get('/certificates/:user',  (req, res)=>{
    let user=req.params.user;
    pool.query("SELECT * FROM certificates WHERE user ='"+user+"'", (error, result, row)=>{
          
        if(error){
            res.send({...response, message:'Error Fetching Certificates '})
        }else{
            res.send({...response, message:`Certificates fetched successfully`, status:true, data:result})
        }})
})





app.post('/students', (req, res)=>{
    const {first_name, surname, other_names, email, image, phone, address, lga, state, gender, programme, pro_id, dob, marital, guarantor,guarantor_image, guarantor_phone, guarantor_address, date_admitted}=req.body;
    let reg_no='ROI'+parseInt(Math.random(0,1)*200000);
    
    if(first_name==="" || first_name===undefined || surname==="" || surname===undefined || email==="" || email===undefined || phone==="" || phone===undefined || image==="" || image===undefined || guarantor_image==="" || guarantor_image===undefined || programme==="" || programme===undefined){
        res.send({...response, message:'All Fields are required'})
    }else{
       
pool.query("SELECT * FROM students WHERE email='"+email+"'", (error, result, row)=>{
if(result.length>0){
    res.send({...response, message:'User Already Exist with '+email})
}else{

    pool.query("INSERT INTO `students` (`id`, `first_name`, `surname`, `other_names`, `dob`, `marital`, `phone`, `email`, `address`, `lga`, `state`, `guarantor`, `guarantor_image`, `guarantor_phone`, `reg_no`, `fee_paid`, `fee`, `image`, `programme`, `graduated`, `prog_id`, `gender`, `guarantor_address`, `date_admitted`) VALUES (NULL, '"+first_name+"', '"+surname+"', '"+other_names+"', '"+dob+"', '"+marital+"', '"+phone+"', '"+email+"', '"+address+"', '"+lga+"', '"+state+"', '"+guarantor+"', '"+guarantor_image+"', '"+guarantor_phone+"', '"+reg_no+"', '', '30000', '"+image+"', '"+programme+"', '', '"+pro_id+"', '"+gender+"', '"+guarantor_address+"', '"+date_admitted+"');", (error, result, row)=>{
        if(error){
              res.send({...response, message:'Error Registering New Student'})
         }
         else{
             res.send({...response, message:'Registered Successfully', status:true})
         }
     })
}
})   
    }
})





app.post('/staff', (req, res)=>{
    
    const {first_name, surname, other_names,image, religion, accno, accname, bank,  email,  phone, address, lga, state, gender,  dob, marital, guarantor,guarantor_image, guarantor_phone}=req.body;
    let date_created=new Date();

    
    if(first_name==="" || first_name===undefined || surname==="" || surname===undefined || email==="" || email===undefined || phone==="" || phone===undefined || image==="" || image===undefined || guarantor_image==="" || guarantor_image===undefined){
        res.send({...response, message:'All Fields are required'})
    }else{
       
pool.query("SELECT * FROM staff WHERE email='"+email+"'", (error, result, row)=>{
if(result.length>0){
    res.send({...response, message:'User Already Exist with '+email})
}else{

    pool.query("INSERT INTO `staff` (`id`, `date_created`, `salary`, `first_name`, `surname`, `other_names`, `image`, `gender`, `dob`, `marital`, `religion`, `phone`, `email`, `address`, `lga`, `state`, `accno`, `accname`, `bank`, `guarantor_name`, `guarantor_phone`, `guarantor_image`) VALUES (NULL, '"+date_created+"', '', '"+first_name+"', '"+surname+"', '"+other_names+"', '"+image+"', '"+gender+"', '"+dob+"', '"+marital+"', '"+religion+"', '"+phone+"', '"+email+"', '"+address+"', '"+lga+"', '"+state+"', '"+accno+"', '"+accname+"', '"+bank+"', '"+guarantor+"', '"+guarantor_phone+"', '"+guarantor_image+"');", (error, result, row)=>{
        if(error){
              res.send({...response, message:'Error Registering New Staff'})
         }
         else{
             res.send({...response, message:'Registered Successfully', status:true})
         }
     })
}
})   
    }
})





app.post('/students/:email', (req, res)=>{
    let db={};
    pool.query("SELECT * FROM students WHERE email='"+req.params.email+"'", (error, result, row)=>{          
        if(error){
           
        }else{    
        
  db=result[0]
  const body ={...db, ...req.body}
  const {first_name, surname, password, phone, address, lga, state, programme, activity }=body;
      pool.query("UPDATE students SET first_name='"+first_name+"', surname='"+surname+"', password='"+password+"', phone='"+phone+"', address='"+address+"', lga='"+lga+"', state='"+state+"', programme='"+programme+"', activity='"+activity+"'  WHERE email='"+req.params.email+"';", (error, result, row)=>{
          if(error){
              res.send({...response, message:'Error Updating Student'})
         }
         else{
             res.send({...response, message:'Updated Successfully', status:true})
         }
      })
        }})
})



app.post('/staff/:email', (req, res)=>{
    let db={};
    pool.query("SELECT * FROM staff WHERE email='"+req.params.email+"'", (error, result, row)=>{          
        if(error){
           
        }else{    
        
  db=result[0]
  const body ={...db, ...req.body}
  const {first_name, surname, password, phone, address, lga, state, programme, activity }=body;
      pool.query("UPDATE staff SET first_name='"+first_name+"', surname='"+surname+"', password='"+password+"', phone='"+phone+"', address='"+address+"', lga='"+lga+"', state='"+state+"', programme='"+programme+"', activity='"+activity+"'  WHERE email='"+req.params.email+"';", (error, result, row)=>{
          if(error){
              res.send({...response, message:'Error Updating Student'})
         }
         else{
             res.send({...response, message:'Updated Successfully', status:true})
         }
      })
        }})
})






app.post('/payments', (req, res)=>{
    const {payer, description, amount, status, tran_id}=req.body;

    pool.query("SELECT * FROM students WHERE reg_no='"+payer+"'", (error, result, row)=>{          
        if(error){
            res.send({...response, message:'Error Posting Payment'})
        }else{  
if(result.length>0){
    let pay_id='T'+parseInt(Math.random(0,1)*200000);

    pool.query("INSERT INTO `payments` (`id`, `transaction_id`, `description`, `amount`, `payer`, `status`, `date_initiated`, `payment_id`) VALUES (NULL, '"+tran_id+"', '"+description+"', "+amount+", '"+payer+"', '"+status+"', '"+new Date() +"', '"+pay_id+"');", (error, result, row)=>{
        if(error){
            res.send({...response, message:'Error Posting Payment'})
        }
        else{
            res.send({...response, message:'Payment Processed Successfully', status:true})
        }
    })
}else{
    res.send({...response, message:'No Student with Registration Number provided! Try again'}) 
}
         }

    })


    
       
    
})





app.get('/play', (req, res)=>{
    
})




app.listen(9000, ()=>{
console.log('listening at port 9000');
})