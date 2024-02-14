const express = require('express');
const User = require('../models/user');


const authRouter = express.Router();

authRouter.post('/auth/sighup',async(req,res) => {
    try{
        const {email,password,name} = req.body;

        const existingUser = await User.findOne({email});
        if(existingUser){
            return res.status(500).json({msg:'User With the Same Email id already exists'});
        }
        let user = new User({
            email,
            password,
            name,
        });

        user = await user.save();
        res.json({user});
    }catch(e){
        res.status(400).json({error:e.message});
    }
});

module.exports = authRouter;