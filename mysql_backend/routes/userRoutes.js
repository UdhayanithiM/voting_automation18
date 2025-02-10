const express = require("express");
const router = express.Router();
const db = require("../db/db");

// ✅ Registration Route (Ensure this exists)
router.post("/register", (req, res) => {
    const { name, email, password } = req.body;

    if (!name || !email || !password) {
        return res.status(400).json({ message: "All fields are required." });
    }

    const query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
    db.query(query, [name, email, password], (err, results) => {
        if (err) {
            console.error("Database error:", err);
            return res.status(500).json({ message: "Database error.", error: err.sqlMessage });
        }
        res.status(201).json({ message: "Registration successful!" });
    });
});

module.exports = router;
