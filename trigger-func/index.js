const express = require('express');
const app = express();
app.use(express.json());

const config = {    
    port: process.env.PORT || 8080,
  };

app.post('/', (req, res) => {            
    res.status(201).send(req.body);
});


app.listen(config.port, () => {
  console.log(`Listening on ${config.port}`)
})