const desk = {
    height: "4 feet",
    weight: "30 pounds",
    color: "brown",
    material: "wood",
  };
//console.log(desk.height);

const programmer = {
    firstname: "Phil",
    age: 21,
    backendDeveloper: true,
    languages: ["Python", "JavaScript", "Java", "C++"],
    "current project name": "The Amazing App"
 };

 //console.log(programmer["current project name"]);

 const animal = {
    type: "cat",
    name: "kitty",
    sounds() { console.log("meow meow") }
 };
 //calling function
 //animal.sounds();

 const book={};
 //inserting value into object book
 book.author='jan samli';
 book.publicationyear=2019;
//  console.log(book);
 //deleting the object from object book
 delete book.publicationyear;
//  console.log(book);

 //Bracket Notation
 const Bracket={}
 //inserting values into object using bracket notation
 Bracket["Name"]='santhosh';
 Bracket["id"]='10790';
 Bracket['salary']='200000';
 Bracket['fun']=function(){
    console.log('called function');
}
//  Bracket.fun()

 const runner = {
    name: "Jessica",
    age: 20,
    milesPerWeek: 40,
    race: "marathon"
 };
//  console.log(Object.keys(runner));
//  console.log(Object.values(runner));

 //let and var keywords
 let i=10;              //let not allow to declare with already declard variable name 
 const PI=20;           //by using const keyword we can't change the declared value
//  console.log(i,PI);

 //array function
 let fun=()=>{console.log('hello santhosh');}
 //fun()

 //multiple line String
 let message= `Hello World,
 Greetings to all,
 Keep Learning and Practicing!`
//console.log(message);

//default parameters
//ES6
let calculater=function(height =100,width =200)
{
    console.log(height*width);
}
// calculater(10,20) //with parameters 20
// calculater() //with out parameters  20000
//ES5
let calculater1=function(height,width)
{   
    height=height||100;
    width=width||200
    console.log(height*width);
}
//calculater1()

//Template literal
let firstName='santhosh',secondName='goud' 
let name=`Hello ${firstName} ${secondName} Welcome`
//console.log(name);

//destructuring Assignment
    //array destructuring
    let arrayDestr=['frstValue','secondValue'];
    let[a,b]=arrayDestr;
    console.log(a,b);

//object destructing 
    let objectDestr={frstName:"sanjay",id:10790};
    let {id,frstName}=objectDestr
    console.log(id,frstName);

//enhanced Object literal
    function enhancedObjectLiteral(mobileName,model,Manufacturedyear) {
        return {mobileName,model,Manufacturedyear}
    }
   console.log(enhancedObjectLiteral('onePlues','y1s',2015));
//classes in js
    class sampleclass{
        constructor(firstName,lastName)
        {
            this.firstName=firstName;
            this.lastName=lastName
        }
        getName()
        {
            console.log(`my name is ${this.firstName} ${this.lastName}`);
        }
    }
    let obj=new sampleclass('santhosh','goud');
    obj.getName();

//Modules
// export var num = 50; 
// export function getName(fullName) {   
//    //data
// };
// import {num, getName} from 'module';
// console.log(num); // 50

