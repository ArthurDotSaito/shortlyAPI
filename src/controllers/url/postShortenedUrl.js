import { sanitize } from "../../middlewares/utils/sanitize.js";
import connection from "../../database/databaseConnection.js";
import { nanoid } from "nanoid";

export const postShortenedUrl = async (req, res) =>{
    const {url} = sanitize(req.body);
    const id = req.userId;
    const shortURL = nanoid(20);

    try{
         await connection.query({
            text:"INSERT INTO url (userId, originalURL, shortURL) VALUES ($1, $2, $3)",
            values:[id, url, shortURL]
        })

        const dbResult = await connection.query({
            text:'SELECT id as "selectedID" FROM url WHERE userId = $1 AND originalURL = $2',
            values:[id, url]
        });
        const insertedId = dbResult.rows[0].selectedID;

        return res.status(201).send({
            id: insertedId,
            shortUrl: shortURL
        })

    }catch(error){
        console.log("Erro ao tentar criar a shorID!");
        res.status(500).send(error.message);
    }
}