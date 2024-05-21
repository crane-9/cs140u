/**
 * This is an incredibly basic NodeJS server for my Docker hello world program.
 */
var fs = require('fs');
var http = require('http');
var path = require('path');

const PORT = 8080;

// Calculate path.
const file = path.join(__dirname, 'hello_world.png');

http.createServer((req, res) => {
    
    // Open image
    var s = fs.createReadStream(file);

    // On success, return the image.
    s.on('open', function () {
        res.writeHead(200, {'Content-Type': "image/png"});
        s.pipe(res);
    });

    // On error, return JSON message.
    s.on('error', (err) => {
        console.error(err);
        res.writeHead(404, {'Content-Type': "application/json"});
        res.end(JSON.stringify({
            status: 400,
            message: "There was an issue finding the image, but you are connected to the server!",
            error: true
        }));
    })
}).listen(PORT);

console.log(`Server running on port ${PORT}!`)