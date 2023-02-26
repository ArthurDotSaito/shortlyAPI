import connection from "../../database/databaseConnection.js";

export const openShortenedUrl = async(req,res) =>{

    const {shortUrl} = req.params


    try {
        const dbResponse = await connection.query(
            'SELECT originalUrl, visitCounter as "visitCount" FROM url WHERE shortUrl = $1',
            [shortUrl]
        )

        console.log("rows", dbResponse.rows[0]);
        console.log("rowCount", dbResponse.rowCount)

        if (dbResponse.rowCount === 0) return res.status(404).send("shortURL não encontrada")

        await connection.query(
            "UPDATE url SET visitCounter = $1 WHERE shortUrl = $2",
            [dbResponse.rows[0].visitCount + 1, shortUrl]
        )

        return res.redirect(dbResponse.rows[0].originalUrl)

    } catch (err) {
        console.log(err)
        return res.sendStatus(500)
    }
}