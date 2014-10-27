/***************** MyObject1 ********************/
function MyObject1() {
	//throw new Error('Exception for myObject1');
}
MyObject1.prototype.constructor = MyObject1;

MyObject1.prototype.myMethod = function () {
	console.log('do stuff for myMethod');
};

MyObject1.prototype.toString = function() {
	return '[object MyObject1]';
};

/***************** MyObject2 ********************/
function MyObject2() {
	MyObject1.call(this);
}
MyObject2.prototype = Object.create(MyObject1.prototype);
MyObject2.prototype.constructor = MyObject2;

MyObject2.prototype.toString = function() {
	return '[object MyObject2]';
};

/***************** Code ********************/
var obj1 = new MyObject1();
obj1.myMethod();

var obj2 = new MyObject2();
obj2.myMethod();

console.log(obj1.toString());
console.log(obj2.toString());

console.log(obj1);
console.log(obj2);

console.log('instance of obj1: ' + (obj1 instanceof MyObject1));
console.log('instance of obj1: ' + (obj1 instanceof MyObject2));
console.log('instance of obj1: ' + (obj1 instanceof Object));

console.log('instance of obj2: ' + (obj2 instanceof MyObject1));
console.log('instance of obj2: ' + (obj2 instanceof MyObject2));
console.log('instance of obj2: ' + (obj2 instanceof Object));