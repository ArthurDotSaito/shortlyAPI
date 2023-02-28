import connection from "../../database/databaseConnection.js";

export const getRanking = async (req, res) =>{
    const limit = 10;

    try{
        const dbResponse = await connection.query(
            `
            SELECT
                users.id, 
                users.name,
                COUNT(DISTINCT url.id) AS "linksCount",
                SUM(url.visitCounter) AS "visitCount"
            FROM users
            LEFT JOIN url ON users.id = url.userId
            GROUP BY users.id
            ORDER BY "visitCount" DESC
            LIMIT $1
            `,
            [limit]
        )

        return res.status(200).send(dbResponse.rows)
    }catch(error){
        console.error(error);
        res.status(500).json({ message: 'Erro ao consultar o banco de dados ao retornar ranking' });
    }
}