//Asynchronous

setTimeout(()=>{
    console.log('fired third');
},2000);

console.log('fired last');

// output
/*fired first
fired second
fired last
fired third*/

//To define an async function

const asyncFunc = async() => {

}

//calling the async function

const test = asyncFunc();
console.log(test);

const asyncFunct = async () => {
	const response = await fetch(resource);
   	const data = await response.json();
}

console.log(1);
cosole.log(2);

asyncFunc().then(data => console.log(data));

console.log(3);
console.log(4);

/*1
2
3
4
data returned by asyncFunc */

var async = require("async");

function square(x) {
	return new Promise((resolve) => {
		setTimeout(() => {
			resolve(Math.pow(x, 2));
		}, 2000);
	});
}

async function output(x) {
	const ans = square(x);
	console.log(ans);
}

output(10);
var async = require("async");

function square(x) {
	return new Promise((resolve) => {
		setTimeout(() => {
			resolve(Math.pow(x, 2));
		}, 2000);
	});
}

async function output(x) {
	const ans = await square(x);
	console.log(ans);
}

output(10);

var async = require("async");

function square(a, b) {
	return new Promise(resolve => {
		setTimeout(() => {
			resolve(a + b);
		}, 2000);
	});
}

async function output(a, b) {
	const ans = await square(a, b);
	console.log(ans);
}

output(10, 20);

//call back function
let stocks={
	Fruits:['mango','apple','grapes','tomata'],
	liquid:['water','ice'],
	holder:['cone','cup','stick'],
	toppings:['chocolate','peanuts']
}
let order=(frtName,calling_production)=>{
	setTimeout(() => {
		console.log(`${stocks.Fruits[frtName]} you are selected `);
		calling_production()
	}, 1000);
	
	}

let production=()=>
{
	setTimeout(() => {
		console.log('production preparing');
		setTimeout(() => {
			console.log('the food as been chopped');
			setTimeout(() => {
				console.log(`Adding ${stocks.liquid[0]} and ${stocks.liquid[1]}`);
				setTimeout(() => {
					console.log('Start Machine');
					setTimeout(() => {
						console.log(`${stocks.holder[1]}`);
					}, 2000);
				}, 1000);
			}, 1000);
		}, 2000);
	}, 0000);
	
}

order(2,production)
