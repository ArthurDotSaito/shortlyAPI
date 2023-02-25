import { sanitize } from "../../middlewares/utils/sanitize.js";
import connection from "../../database/databaseConnection.js";
import bcrypt from 'bcrypt';

export const postSignIn = async (req, res, next) =>{
    const {email, password: typedPassword} = sanitize({...req.body});

    try{
        const dbResponse = await connection.query("SELECT * FROM users WHERE email = $1", [email])
        if(dbResponse.rowCount === 0) return res.sendStatus(401);

        const {id, password: passwordStored} = dbResponse.rows[0];
        req.userId = id;
        if(!(bcrypt.compareSync(typedPassword,passwordStored))) return res.sendStatus(401);

    }catch(error){
        console.log("Erro ao tentar realizar o login!");
        res.status(500).send(error.message);
    }
    next();
}