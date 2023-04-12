const express=require('express');
require("dotenv").config();
const app=express();
const books=require('./books.json')

app.get('/',(req,res)=>{
    console.log(books);
    res.json(books);
})
app.get('/:id',(req,res)=>{
    const { id } = req.params;
    let filterbooks=Object.values(books);
    const filteredBooks = filterbooks.filter(book => book.books.some(author => author.id === id));
    console.log(filterbooks);
    res.json(filterbooks.filter((ele) => ele.id === parseInt(id)));
})

app.listen(process.env.PORT,()=>{
    console.log("Running on Port ",process.env.PORT);
})
