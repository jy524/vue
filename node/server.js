let http = require('http');

http.createServer(function(request, response) {
    response.writeHead(200, { 'Content-Type': 'text/plain' })

    response.end('hello china\n');
}).listen(1010);

console.log('server start');