const http =require('http');
const fs=require('fs')
const fileContent =fs.readFileSync('index.html')

const hostname='localhost';
const port =3000;

const server = http.createServer ((req, res) => {
  res.writeHead (200,{'Content-Type':'text/html'});
  res.end( fileContent);
});

server.listen(port,hostname,()=>{
    console.log("server running:3000")
});

