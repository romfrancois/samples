import 'dart:io';
import 'dart:math';

/**
 * Given a list of link b/w 2 points, give the longuest path.
 */

/* Wrapup for debugging purpose */
debug(String msg) {
    stderr.writeln(msg);
}

class Node {
    int id;

    Node(this.id);

    String toSting() {
        return '$id';
    }
}

var RELATIONS = [
    '1 2'
    , '1 3'
    , '3 4'
    , '2 4'
    , '2 5'
    , '10 11'
    , '10 1'
    , '10 3'
  ];

int computeMaxDepth(int index, List<Node> neighboors) {
//  debug('\ncurrentNodeID: $index');

  if (neighboors == null) {
//    debug('No further node');
    return 0;
  }

  int maxDepth = 0;
  for (Node neighboor in neighboors) {
//    debug('Looking through another node');
    maxDepth = max(maxDepth, computeMaxDepth(neighboor.id, graph[neighboor.id]));
  }

  return maxDepth + 1;
}

Map<int, List<Node>> graph = new Map();
void main() {
    List inputs;
    int N = 8; //int.parse(stdin.readLineSync());
    debug('# relations: $N');


    Map<int, int> nodeDepth = new Map();

    for (int i = 0; i < N; i++) {
        inputs = RELATIONS[i].split(' '); //stdin.readLineSync().split(' ');
        int X = int.parse(inputs[0]);
        int Y = int.parse(inputs[1]);
        debug('X: $X | Y: $Y');

        List<Node> currentChildren;
        int nodeIdx = 0;

        Node newNode = new Node(Y);
        if (graph.containsKey(X)) {
//          debug('Adding: ${newNode.id} ...');
          currentChildren = graph[X];
        }
        else {
//          debug('Creating: $X');
          currentChildren = new List();
        }
        currentChildren.add(newNode);
        graph[X] = currentChildren;
        nodeDepth[X] = 1;
    }

    int longuestRelation = 0;
    graph.forEach((key, values) {
//          debug('\nkey: $key | value: $values');
          nodeDepth[key] += computeMaxDepth(key, values);
//          debug('nodeDepth[key]: ${nodeDepth[key]}');

          if (longuestRelation < nodeDepth[key]) {
            longuestRelation = nodeDepth[key];
          }
    });

//    nodeDepth.forEach((nodeId, maxDepth) {
//      debug('\ncurrentNodeID: $nodeId | maxDepth: $maxDepth');
//    });

    debug('\nlonguestRelation: $longuestRelation');

    print('$longuestRelation');
}