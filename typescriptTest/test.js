var http = require('http');

http.createServer(function (request, response) {

    // console.log('ddddddddddddddddd', request);
    // console.log(`响应头: ${JSON.stringify(request.headers)}`);
    response.writeHead(200, { 'Content-Type': 'text/plain' });

    let body = [];
    request.on('data', (chunk) => {
        body.push(chunk);
    }).on('end', () => {
        body = Buffer.concat(body).toString();
        // at this point, `body` has the entire request body stored in it as a string
        response.end('Hello World\n' + body);
    });

}).listen(8081);

console.log('Server running at http://127.0.0.1:8081/');