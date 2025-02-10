const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const userRoutes = require("./routes/userRoutes");

const app = express();
const port = 5000;

// ✅ Middleware
app.use(cors());
app.use(bodyParser.json());

// ✅ Use Routes
app.use("/api/users", userRoutes);  // Ensure this line is correct!

// ✅ Start Server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
