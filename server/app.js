const express = require('express');
const htpp = require('http');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');

const port = 3000;
const app = express();

app.use(express.json());
app.use(authRouter);


const DB = 'mongodb+srv://108me18044:108me180@cluster0.hwbvlun.mongodb.net/?retryWrites=true&w=majority';

mongoose.connect(DB).then(()=>{
console.log ("Data base connection successfull")
}).catch((e)=>{
    console.log(e.message);
})
app.listen(port,()=>{
    console.log("Server is ready for connection !")
})