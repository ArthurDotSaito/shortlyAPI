import connection from '../../database/databaseConnection.js';
import { sanitize } from '../utils/sanitize.js';

export const verifyToken = async(req,res) => {
    const id = sanitize(req.userId);

    try{
        const dbResponse = await connection.query("SELECT token FROM authtoken WHERE userId = $1", [id])
        console.log(dbResponse.rowCount)
        if(dbResponse.rowCount > 1){
            return res.status(409).send("token já existe!")
        }else if(dbResponse.rowCount !== 0){
            const {token} = dbResponse.rows[0];
            return res.send({token});
        }
        
    }catch(error){
        console.log("Erro ao tentar verificar o token!");
        res.status(500).send(error.message);
    }
}
