const XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest
//Prmoise Resolved state declaration
let promiseresolve = new Promise(function(resolve, reject) {
    resolve("I am done");
});

//promise Reject State declaration 

let promisereject = new Promise(function(resolve, reject) {
  //  reject(new Error('Something is not right!'));
});

//only one resolve or one reject will be executed

let promiseIgnor = new Promise(function(resolve, reject) {
    resolve("I am surely going to get resolved!");
  
    reject(new Error('Will this be ignored?')); // ignored
    resolve("Ignored?"); // ignored
  })

  //Creating the function  
  function getPromise(URL) {
    let promise = new Promise(function (resolve, reject) {
      let req = new XMLHttpRequest();
      req.open("GET", URL);
      req.onload = function () {
        if (req.status == 200) {
          resolve(req.response);
        } else {
          reject("There is an Error!");
        }
      };
      req.send();
    });
    return promise;
  }

  //Example 1: Get 50 Pokemon's information

const ALL_POKEMONS_URL = 'https://jsonplaceholder.typicode.com/todos/50';
const POKEMONS_BAD_URL = 'https://jsonplaceholder.typicode.com/todos/BAD';

// We have discussed this function already!
let promise = getPromise(ALL_POKEMONS_URL);

const consumer = () => {
    promise.then(
        (result) => {
            console.log({result}); // Log the result of 50 Pokemons
        },
        (error) => {
            // As the URL is a valid one, this will not be called.
            console.log('We have encountered an Error!',error); // Log an error
    });
}

//consumer();

// This will reject as the URL is 404
let promisecatch = getPromise(POKEMONS_BAD_URL);

const consumercatch = () => {
    promisecatch.catch(error => console.log(error));
}

consumercatch();

//using finaly

let loading = true;
loading && console.log('Loading...');

// Gatting Promise
promise = getPromise(ALL_POKEMONS_URL);

promise.finally(() => {
    loading = false;
    console.log(`Promise Settled and loading is ${loading}`);
}).then((result) => {
    console.log({result});
}).catch((error) => {
    console.log(error)
});