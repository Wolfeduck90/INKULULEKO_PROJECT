const bcrypt = require('bcrypt');
const hashedPassword = await bcrypt.hash(password, 10); // Salt rounds: 10


const query = 'INSERT INTO Users (username, password, email) VALUES (?, ?, ?)';
db.query(query, [username, hashedPassword, email], (err, result) => {
    if (err) throw err;
    console.log('User added successfully!');
});
