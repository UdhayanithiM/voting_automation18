const express = require("express");
const router = express.Router();
const db = require("../db/db");

// ✅ Registration Route
router.post("/register", (req, res) => {
  const { name, email, password } = req.body;
  if (!name || !email || !password) {
    return res.status(400).json({ message: "All fields are required." });
  }

  const query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
  db.query(query, [name, email, password], (err, results) => {
    if (err) {
      console.error("❌ Database error:", err);
      return res.status(500).json({ message: "Database error.", error: err.sqlMessage });
    }
    res.status(201).json({ message: "✅ Registration successful!" });
  });
});

// ✅ Login Route
router.post("/login", (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) {
    return res.status(400).json({ message: "Email and password are required." });
  }

  const query = "SELECT * FROM users WHERE email = ? AND password = ?";
  db.query(query, [email, password], (err, results) => {
    if (err) {
      console.error("❌ Database error:", err);
      return res.status(500).json({ message: "Database error." });
    }
    if (results.length > 0) {
      res.status(200).json({ message: "✅ Login successful!", user: results[0] });
    } else {
      res.status(401).json({ message: "❌ Invalid email or password." });
    }
  });
});

module.exports = router;
