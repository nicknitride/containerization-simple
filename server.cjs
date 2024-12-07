const express = require('express');
const path = require('path')

const app = express();
const PORT = process.env.PORT || 8080;

// Serve static files from the "dist" directory
app.use(express.static(path.join(__dirname, 'dist')));

// Catch-all route to serve the index.html for SPAs
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'dist', 'index.html'));
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
