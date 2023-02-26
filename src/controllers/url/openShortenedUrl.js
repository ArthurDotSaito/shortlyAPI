import connection from "../../database/databaseConnection.js";

export const openShortenedUrl = async(req,res) =>{

    const {shortUrl} = req.params
    console.log(typeof(shortUrl))
    try {
        const { rowCount, rows } = await connection.query(
            'SELECT originalUrl, visitCounter as "visitCount" FROM url WHERE shortUrl = $1',
            [shortUrl]
        )
        console.log("shortUrl:", shortUrl);
        console.log("rows:", rows);
        console.log(rowCount)
        if (rowCount === 0) return res.status(404).send("shortURL não encontrada")

        await connection.query(
            "UPDATE url SET visitCounter = $1 WHERE shortUrl = $2",
            [rows[0].visitCount + 1, shortUrl]
        )

        return res.redirect(rows[0].originalUrl)

    } catch (err) {
        console.log(err)
        return res.sendStatus(500)
    }
}