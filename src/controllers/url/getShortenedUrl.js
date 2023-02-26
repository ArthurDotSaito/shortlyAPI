import connection from "../../database/databaseConnection.js";

export const getShortenedUrl = async(req,res) =>{
    const {id} = req.params;
    console.log(id)

    try{
        const dbResponse = await connection.query('SELECT id, shortURL as "shortUrl", originalURL as "url" FROM url WHERE id=$1',[id]);
        console.log(dbResponse.rows[0])

        if(dbResponse.rowCount[0] === 0) return res.status(404).send("Id não encontrado");

        return res.status(200).json(dbResponse.rows[0]);
    }catch(error){
        console.log("Erro ao tentar buscar as informações via Id");
        res.status(500).send(error.message);
    }
}