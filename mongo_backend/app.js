const express = require("express");
const cors = require("cors");
require("dotenv").config(); // Load environment variables

const connectDB = require("./config/db"); // ✅ Corrected Import
connectDB(); // ✅ Connect to MongoDB

const app = express();
app.use(express.json()); // Parse JSON requests
app.use(cors()); // Enable CORS

// ✅ Example Route
app.get("/", (req, res) => {
  res.send("🚀 MongoDB Backend Running Successfully!");
});

// ✅ Import Routes (Ensure `routes/auth.js` exists)
const authRoutes = require("./routes/auth");
app.use("/auth", authRoutes);

// Start Server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
});
