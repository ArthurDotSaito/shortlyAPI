import {sanitize} from './utils/sanitize.js';
import connection from '../database/databaseConnection.js';

export default async function verifyDoubleEmail(req,res,next){
    const data = sanitize({...req.body});
    const {email} = data;

    try{
        console.log(email)
        const result = await connection.query("SELECT COUNT(*) FROM users WHERE email = $1", [email]);
        const emailCount = Number(result.rows[0].count);
        if(emailCount !== 0) return res.status(409).send("Usuário já existe!");
    }catch(error){
        console.log("erro na verificação do emailDoubleverify!");
        const errorMessage = error.details.map(err => err.message).join(", ");
        return res.status(500).json({message: errorMessage});
    }
    next();
}