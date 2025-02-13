const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const userRoutes = require("./routes/userRoutes");

const app = express();
const port = 3000; // Ensure the correct port

// ✅ Middleware (Ensures JSON is correctly parsed)
app.use(cors());
app.use(bodyParser.json()); // This enables JSON parsing
app.use(bodyParser.urlencoded({ extended: true })); // Enables form data parsing

// ✅ Routes
app.use("/api/users", userRoutes);

// ✅ Test route to check server is running
app.get("/", (req, res) => {
  res.send("🚀 API is working!");
});

// ✅ Start Server
app.listen(port, () => {
  console.log(`✅ Server running on http://localhost:${port}`);
});
