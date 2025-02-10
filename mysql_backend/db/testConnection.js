const db = require('./db'); // Import the database connection

// Test the connection by running a simple query
db.query('SELECT 1 + 1 AS solution;', (err, results) => {
    if (err) {
        console.error('❌ Error executing query:', err.message);
        return;
    }
    console.log('✅ Test query executed successfully.');
    console.log('Result:', results[0].solution); // Should output "2"
});

// Close the connection after testing
db.end((err) => {
    if (err) {
        console.error('❌ Error closing the connection:', err.message);
    } else {
        console.log('✅ Connection closed successfully.');
    }
});
