import jwt from "jsonwebtoken";

import { Request,Response,NextFunction } from "express";


async function optionalouth(req:Request,res:Response,next:NextFunction) {
    const token=req.headers.token;
    const validtoken=jwt.verify(token,"SECRECT");
    // if(!validtoken.userid){return res.status(400).json({message:"token not found"})};
    if(!validtoken.userid){
        req.userid=null;
        return;
    }
    else{
        req.userid=validtoken.userid;
    }
    next();


    
    

    
}
// module.exports={
//     optionalouth:optionalouth
// }

export{optionalouth};