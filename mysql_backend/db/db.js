const mysql = require('mysql2'); // Use mysql2 for better support

const db = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'Udhaya@9600', // ✅ Your MySQL Password
    database: 'voting', // ✅ Correct Database Name
});

db.connect((err) => {
    if (err) {
        console.error('❌ Database connection failed:', err.message);
    } else {
        console.log('✅ Connected to the database.');
    }
});

module.exports = db;
