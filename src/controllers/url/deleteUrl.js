import connection from "../../database/databaseConnection.js";

export const deleteUrl = async(req,res) =>{
    const {id} = req.params;
    const userIdSent = req.userId;

    try{
        const dbResponse = await connection.query('SELECT userId FROM url WHERE id=$1',[id]);

        if(dbResponse.rowCount === 0) return res.status(404).send("Id não encontrado");

        const userIdReceived = dbResponse.rows[0].userid;

        if(userIdReceived !== userIdSent){
            return res.status(401).send("userId enviado não correspondente!");

        }else{
            const deleteResponse = await connection.query("DELETE FROM url WHERE id = $1", [id]);
            if(deleteResponse.rowCount === 0) return res.status(404).send("id não encontrado!");

            return res.status(204).send("URL excluida");
        }
        
    }catch(error){
        console.log("Erro ao tentar buscar as informações via Id");
        res.status(500).send(error.message);
    }
}