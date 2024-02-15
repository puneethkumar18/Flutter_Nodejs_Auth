const mongoose = require('mongoose');


const userSchema = mongoose.Schema({
    name :{
        type:String,
        required : true,
        trim : true,
    },
    email:{
        type:String,
        required : true,
        trim : true,
        validate:{
            validator : (value)=>{
            const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return value.match(re);
          },
          massage : 'Plaease enter the correct Email Address .'
        }
    },
    password:{
        type:String,
        required : true,
        trim : true,
    }
});

const User = mongoose.model('User',userSchema);
module.exports = User;