const express = require('express');
require("dotenv").config();
var bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());
const books = require('./books.json')

app.get('/', (req, res) => {
    console.log(books);
    res.json(books);
})
app.get('/:id', (req, res) => {
    const { id } = req.params;
    let filterbooks = Object.values(books);
    const filteredData = filterbooks.map(nestedArray => {
        return nestedArray.filter(obj => obj.id == id);
    });
    res.json(filteredData);
})

app.post('/', (req, res) => {

    const body = req.body;
  
    console.log(req.body);
    let filterbooks = Object.values(books);

    filterbooks.push(body);
   
    res.json({message: 'The book has been added'});
  
  });

app.listen(process.env.PORT, () => {
    console.log("Running on Port ", process.env.PORT);
})
