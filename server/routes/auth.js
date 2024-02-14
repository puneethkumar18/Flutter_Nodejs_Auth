const express = require('express');
const User = require('../models/user');
const auth = require('../middlewares/auth');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');


const authRouter = express.Router();

authRouter.post('/auth/sighup',async(req,res) => {
    try{
        const {email,password,name} = req.body;

        const existingUser = await User.findOne({email});
        if(existingUser){
            return res.status(500).json({msg:'User With the Same Email id already exists'});
        }
        const  hashedPassword = bcrypt.hash(password,8);


        let user = new User({
            email,
            password:hashedPassword,
            name,
        });

        user = await user.save();
        res.json({...user._doc});
    }catch(e){
        res.status(400).json({error:e.message});
    }
});

authRouter.post('/auth/signin',async(req,res) => {
    try {
        const {email,password} = req.body;
        const user = await User.findOne({email});
        if(!user) return res.status(400).json({msg:"No user Exists with this email"});

        const isMatch = bcrypt.compare(user._id,password);
        if(!isMatch){
            return res.status(400).json({msg:'Incorrect Password'})
        }
        const token = jwt.sign({id:user._id},'passwordKey');
        res.json({token,...user._doc});

    } catch (e) {
        res.status(400).json({error:e.message});
    }
});

module.exports = authRouter;