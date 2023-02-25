import {v4 as uuidV4} from 'uuid';
import { sanitize } from '../utils/sanitize.js';
import connection from '../../database/databaseConnection.js';

export const createToken = async(req,res,next) => {
    const token = uuidV4();
    const id = sanitize(req.userId);

    try{
        await connection.query({
            text:"INSERT INTO authtoken (token, userId) VALUES ($1,$2)",
            values:[token, id],
        })
    }catch(error){
        console.log("erro ao tentar criar o token!");
        console.log(error.details)
        const errorMessage = error.details.map(err => err.message).join(", ");
        res.status(500).json({message: errorMessage});
    }
    next();
}