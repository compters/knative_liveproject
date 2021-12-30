const express = require('express');
const app = express();
app.use(express.json());

const config = {    
    port: process.env.PORT || 8080,
  };

app.post('/', (req, res) => {      
  const body = req.body;  
  if(!body || Object.keys(body).length === 0) {    
    res.status(400).send();
  } else {
    res.status(201).send(body);
  }
});


app.listen(config.port, () => {
  console.log(`Listening on ${config.port}`)
})