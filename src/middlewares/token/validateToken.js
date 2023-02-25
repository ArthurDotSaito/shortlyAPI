import connection from "../../database/databaseConnection.js";

export const validateToken = async(req, res, next) =>{
    let token = req.headers.authorization;
    if (!token) return res.status(401).send("Token não encontrado.");

    token = token.replace("Bearer ", "");
    console.log(token)
    try{

        const dbResponse = await connection.query("SELECT * FROM authToken WHERE token = $1", [token]);
        if(dbResponse.rowCount === 0) return res.status(401).send("Token não encontrado na DB.");

        req.userId = dbResponse.rows[0].userid;

    }catch(error){

        console.log("erro ao tentar validar o token!");
        console.log(error.details)
        const errorMessage = error.details.map(err => err.message).join(", ");
        res.status(500).json({message: errorMessage});
    }
    next();
} 