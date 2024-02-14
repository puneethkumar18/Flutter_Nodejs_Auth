const jwt = require('jsonwebtoken');

const auth = (req,res,next)=>{
    try {
        const token = req.header('x-auth-token');
        if(!token) return res.status(400).json({msg:'token is not available'});
        const verified = jwt.verify(token,'passwordKey');
        if(!verified) return res.status(400).json({msg:"Token is not valied"});
        verified.id = _id;
        next();
    } catch (e) {
        res.status(500).json({error:e.message});
    }
}

module.exports = auth;