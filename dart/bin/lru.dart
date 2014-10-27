import 'dart:io';
import 'dart:collection';

/**
 * The LRU (Least Recently Used) caching scheme is to remove the least recently
 * used frame when the cache is full and a new page is
 * referenced which is not there in cache.
 *
 * 1. A Queue which is implemented using a doubly linked list.
 * The maximum size of the queue will be equal to the total
 * number of frames available (cache size).
 * The most recently used pages will be near front end and
 * least recently pages will be near rear end.

 * 2. A Hash with page number as key and address of the
 * corresponding queue node as value.
 * When a page is referenced, the required page may be in the memory.
 * If it is in the memory, we need to detach the node of the list
 * and bring it to the front of the queue.
 * If the required page is not in the memory, we bring that in memory.
 * In simple words, we add a new node to the front of the queue
 * and update the corresponding node address in the hash.
 * If the queue is full, i.e. all the frames are full,
 * we remove a node from the rear of queue,
 * and add the new node to the front of queue.
 *
 * Note: Initially no page is in the memory.
 */

debug(String msg) {
    stderr.writeln(msg);
}

abstract class LRUCache<K, V> {
  final int maxEntries;
  final LinkedHashMap<K, dynamic> _map = new LinkedHashMap();
  int __count = 0;

  LRUCache(this.maxEntries) {
    assert(maxEntries > 0);
  }

//  V build(K key);

  Iterable<K> get keys => _map.keys;
  Iterable<V> get values => _map.values;

  void clear() {
    __count = 0;
    _map.clear();
  }

  int get _count => __count;

  set _count(int value) {
    __count = value;

    while (__count > maxEntries) {
      V removed = _map.remove(_map.keys.first);
      __count--;
    }
  }

  V operator [](K key) {
    dynamic oldValue = _map.remove(key);

    if (oldValue == null) {
      return null;
    }

    _map[key] = oldValue;
    return oldValue;
  }

  operator []= (K key, V value) {
    V oldValue = _map.remove(key);

    if (oldValue == null) {
      _count++;
    }
    _map[key] = value;
  }

  int get length => _count;
}

class LRU extends LRUCache<int, int> {
  LRU(int maxEntries) : super(maxEntries);

//  @override
//  int build(int key) => key;
}

void main() {
  LRUCache lru = new LRU(3);
  assert(lru.length == 0);

  //1st new item
  lru[3] = 6;
  assert(lru.keys.first == 3);
  assert(lru.values.first == 6);

  assert(lru.keys.last == 3);
  assert(lru.values.last == 6);

  assert(lru.length == 1);

  // 2nd new item
  lru[7] = 14;

  // 3rd new item
  lru[2] = 4;

  // 4th new item
  lru[3] = 7;

  assert(lru.keys.first == 7);
  assert(lru.values.first == 14);

  assert(lru.keys.last == 3);
  assert(lru.values.last == 7);

  assert(lru.length == 3);

  // 5th new item
  lru[1] = 2;

  assert(lru.length == 3);

  assert(lru.keys.first == 2);
  assert(lru.values.first == 4);

  assert(lru.keys.last == 1);
  assert(lru.values.last == 2);
}