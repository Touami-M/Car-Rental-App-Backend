const express = require("express");
const mysql = require("mysql");
const bodyParser = require('body-parser');
const multer = require('multer');
const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(bodyParser.raw());
app.use(express.static('public'));


var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database:'tdm'
});
connection.connect();






   app.post('/getuserhashmap',function(req,res){

    var data= null
    var query="select * from user where telephone=? and password=?"
    connection.query(query,[ req.body.telephone,req.body.password],function(error,results){
       if (error) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
       if(results.length>0) {
           data = results[0]
       }
       res.status(200).json(data)
   })
   });

   app.post('/checkuser',function(req,res){
    
    var data = null
    var query="select * from user where telephone=?"
    connection.query(query,[req.body.telephone],function(error,results){
       if (error ) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
       if(results.length>0) {
           data = results[0]
       }
       res.status(200).json(data)
   })
   });




   
   var storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, './public/images/users/')
    },
    filename: function (req, file, cb) {
      cb(null,Date.now()+"-"+file.originalname);
    }
  })

 
   app.post('/createuser',multer({storage: storage}).single('image'),function(req,res){

    var ret = null
    var data = JSON.parse(req.body.user)
    var query="INSERT INTO `user` ( `password`, `name`, `telephone`, `credit_card_num`, `driver_license_doc`) VALUES ( ?, ?,?, ?, ?)"
    

    connection.query(query,[data.password, data.name, data.telephone, data.credit_card_num, "images/users/"+req.file.filename],function(error,results){
       if (error) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
       
        res.status(200).json(ret)
   })
   });



   app.post('/createreserve',function(req,res){

    var data = null    
    var query="INSERT INTO `reservation` (`iduser`, `idcar`, `dateres`, `dateret`,`cost`,`code_pin`) VALUES (?, ?, ?, ?,?,?)"

    connection.query(query,[ req.body.iduser, req.body.idcar, req.body.dateres, req.body.dateret, req.body.cost,req.body.code_pin],function(error,results){
       if (error) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
       if(results.length>0) {
           data = results[0]
       }
       res.status(200).json(data)
   })
   });

   app.post('/rendreres',function(req,res){

    var data = null    
    var query="UPDATE voiture SET dispo = 0 WHERE id=?;"
    connection.query(query,[ req.body.id],function(error,results){
       if (error) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
       if(results.length>0) {
           data = results[0]
       }
       res.status(200).json(data)
   })
   });

   app.post('/rendredispo',function(req,res){

    var data = null    
    var query="UPDATE voiture SET dispo = 1 WHERE id=?;"
    connection.query(query,[ req.body.id],function(error,results){
       if (error) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
       if(results.length>0) {
           data = results[0]
       }
       res.status(200).json(data)
   })
   });

   app.post('/getreserve',function(req,res){

    var data = null    
    var query="SELECT marque,model,lat,longitude,photo_list,photo1,photo2,photo3,dateres,dateret,cost,code_pin FROM reservation inner join voiture on reservation.idcar=voiture.id WHERE iduser=?;"
    connection.query(query,[req.body.iduser],function(error,results){
       if (error) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
       if(results.length>0) {
           data = results
       }
       res.status(200).json(data)
   })
   });

app.get('/getcars',function(req,res){  
    var query = "select * from voiture";
    connection.query(query,function(error,results){
    if (error) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
    
       res.status(200).json(results)

})
});

app.post('/createsaved',function(req,res){

    var data = null    
    var query="INSERT IGNORE INTO `saved` (`iduser`, `idcar`) VALUES (?, ?)"
    connection.query(query,[ req.body.iduser, req.body.idcar],function(error,results){
       if (error) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
       if(results.length>0) {
           data = results[0]
       }
       res.status(200).json(data)
   })
   });

   app.post('/removesaved',function(req,res){

    var data = null    
    var query="DELETE FROM `saved` WHERE `iduser` = ? AND `idcar` = ?"
    connection.query(query,[ req.body.iduser, req.body.idcar],function(error,results){
       if (error) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
       if(results.length>0) {
           data = results[0]
       }
       res.status(200).json(data)
   })
   });

   app.post('/getsaved',function(req,res){

    var data = null    
    var query="select idcar, marque,model,lat,longitude,dispo, prix, couleur, puissance, année,seats,classe,gearbox,description , photo_list,photo1,photo2,photo3 from saved inner join voiture on saved.idcar=voiture.id where iduser=?"
    connection.query(query,[ req.body.iduser],function(error,results){
       if (error) {
           console.log(error)
           res.status(500).json({message:"server error"}) 
       }
       if(results.length>0) {
           data = results
       }
       res.status(200).json(data)
   })
   });




const server = app.listen(8082,function(){
    const host = server.address().address
    const port = server.address().port
});