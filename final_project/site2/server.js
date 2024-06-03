/**
 * This is an incredibly basic NodeJS server for my Docker hello world program.
 */
var http = require('http');

const PORT = 9090;


let counter = 0;

http.createServer((req, res) => {
    counter ++;

    res.writeHead(200, {'Content-Type': "application/json"});
    res.end(JSON.stringify({
        status: 200,
        message: `Hello! This is site2's response to request #${counter}!`
    }))
}).listen(PORT);


console.log(`Server running on port ${PORT}!`)
