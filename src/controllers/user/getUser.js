import connection from "../../database/databaseConnection.js";

export const getUser = async(req,res) =>{
    const userId = req.userId;

    try{
        const dbResponse = await connection.query(
            `
            SELECT
                users.id, 
                users.name,
                SUM(url.visitCounter) AS "visitCount",
                json_agg(
                    json_build_object(
                        'id', url.id,
                        'shortUrl', url.shortUrl,
                        'url', url.originalUrl,
                        'visitCount', url.visitCounter
                    )
                ) AS "shortenedUrls"
            
            FROM users
            JOIN url ON users.id = url.userId
            WHERE users.id = $1
            GROUP BY users.id
            `, [userId]
        )

        if(dbResponse.rowCount == 0) return res.status(404).json({ message: 'Usuário não encontrado' });

        res.status(200).json(dbResponse.rows[0]);
    }catch (error) {
        console.log("Erro ao retornar informações do usuário!")
        console.error(error);
        res.status(500).json({ message: 'Erro ao consultar o banco de dados' });
    }
}