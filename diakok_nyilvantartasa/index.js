const express = require("express");
const mysql = require("mysql2/promise");
require("dotenv").config();

const app = express();
const PORT = 3000;

app.use(express.json());

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

async function testConnection() {
    try {
        const connection = await pool.getConnection();
        console.log(" MySQL kapcsolat létrejött");
        connection.release();
    } catch (error) {
        console.error(" MySQL hiba:", error);
    }
}

testConnection();

app.get("/", (req, res) => {
    res.json({
        aktiv: true,
        vegpontok: [
            "GET /api/osztalyok",
            "GET /api/osztalyok/:id",
            "GET /api/diakok",
            "GET /api/diakok/:id"
        ]
    });
});

app.get("/api/osztalyok", async (req, res) => {
    const [rows] = await pool.query("SELECT * FROM osztalyok");
    res.json(rows);
});

app.get("/api/osztalyok/:id", async (req, res) => {
    const [rows] = await pool.query(
        "SELECT * FROM osztalyok WHERE id = ?",
        [req.params.id]
    );

    res.json(rows);
});

app.get("/api/diakok", async (req, res) => {
    const [rows] = await pool.query(`
        SELECT d.*, o.nev AS osztaly
        FROM diakok d
        INNER JOIN osztalyok o
        ON d.osztaly_id = o.id
    `);

    res.json(rows);
});

app.get("/api/diakok/:id", async (req, res) => {
    const [rows] = await pool.query(`
        SELECT d.*, o.nev AS osztaly
        FROM diakok d
        INNER JOIN osztalyok o
        ON d.osztaly_id = o.id
        WHERE d.id = ?
    `, [req.params.id]);

    res.json(rows);
});

app.listen(PORT, () => {
    console.log(`✅ A szerver fut a ${PORT} porton`);
});