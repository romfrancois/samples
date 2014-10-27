/*
Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and set.

get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
set(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
*/

function assert(condition, message) {
	if (!condition) {
		message = message || "Assertion failed";

		if (typeof Error !== "undefined") {
			throw new Error(message);
		}

		throw message; // Fallback
	}

	console.log(message || '');
}

function LRUCache(maxEntries) {
	this.maxEntries = maxEntries || {};
	this._map = {};
	this.__count = 0;

	this.length = 0;
}

LRUCache.prototype.keys = function() {
	return Object.keys(this._map);
};

LRUCache.prototype.values = function() {
	var keys = Object.keys(this._map);
	var values = {};

	for (var i = 0, n = keys.length; i < n; i++) {
		values[i] = this._map[keys[i]];
	}

	return values;
};

LRUCache.prototype.clear = function() {
	this.__count = 0;
	this._map = {};
};

LRUCache.prototype.put = function(key, value) {
	var oldValue = this._map[key];
	delete this._map[key];

	if (oldValue === undefined) { // One could also check for the '.has' property on '_map'
		this.__count++;
		this.length++;
	}

	this._map[key] = value;
};

LRUCache.prototype.get = function(key) {
	var oldValue = this._map[key];
	delete this._map[key];

	if (oldValue === undefined) { // One could also check for the '.has' property on '_map'
		return undefined;
	}

	this._map[key] = oldValue;
	return oldValue;
};

/*LRUCache.prototype.length = function() {
	return this.__count;
};*/

LRUCache.prototype.toString = function() {
	var result = '';

	return result;
};

/*
LRUCache.prototype = {
	get length() {
		return this.__count; //LRUCache.prototype._length();
	},

	get keys() {
		return Object.keys(this._map);
	}
};
*/

var lru = new LRUCache(3);
//assert(lru.length === 0, 'length is ok 1 ');
assert(lru.length === 0, 'length is ok 2');

//1st new item
lru.put(3, 6);
console.log('Keys: ' + lru.keys());

assert(lru.keys()[0] == 3);
assert(lru.values()[lru.length-1] === 6);

assert(lru.length === 1);

// 2nd new item
lru.put(7, 14);

// 3rd new item
lru.put(2, 4);

// 4th new item
lru.put(3, 7);

assert(lru.keys()[0] == 7);
assert(lru.values()[0] == 14);

assert(lru.keys()[lru.length - 1] === 3);
assert(lru.values()[lru.length - 1] === 7);

assert(lru.length === 3);

// 5th new item
lru.put(1, 2);

assert(lru.length === 3);

assert(lru.keys()[0] === 2);
assert(lru.values()[0] === 4);

assert(lru.keys()[lru.length - 1] === 1);
assert(lru.values()[lru.length - 1] === 2);