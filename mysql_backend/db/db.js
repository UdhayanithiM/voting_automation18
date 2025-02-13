require("dotenv").config();
const mysql = require("mysql2");

const db = mysql.createConnection({
  host: "127.0.0.1",
  user: "root",
  password: "Udhaya@9600", // ✅ Update with your MySQL password
  database: "voting",
});

db.connect((err) => {
  if (err) {
    console.error("❌ Database connection failed:", err.message);
  } else {
    console.log("✅ Connected to the database.");
  }
});

module.exports = db;
