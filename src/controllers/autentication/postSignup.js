import { sanitize } from '../../middlewares/utils/sanitize.js';
import bcrypt from 'bcrypt';
import connection from "../../database/databaseConnection.js";

export const postSignUp = async (req, res) =>{
    const {name, email, password} = sanitize({...req.body});
    const saltRounds = 10;
    const passwordHashed = bcrypt.hashSync(password, saltRounds );
    try{
        await connection.query({
            text:'INSERT INTO users (name, email, password) VALUES ($1, $2, $3)',
            values: [name, email, passwordHashed],
        })
        res.sendStatus(201)
    }catch(error){
        console.log("Erro ao tentar fazer o registro!");
        res.status(500).send(error.message);
    }
}