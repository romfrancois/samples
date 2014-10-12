import 'dart:io';

/**
 * Given a list of Points, give the min length to cover them all.
 * This example illustrate the min length of cable an operator has to use to cover all houses.
 */

/* Wrapup for debugging purpose */
debug(String msg) {
    stderr.writeln(msg);
}

class Link implements Comparable {
  int X;
  int Y;
  int dist = 0;

  Link(this.X, this.Y);

  @override
  int compareTo(Link other) {
    return (Y <= other.Y) ? -1: 1; //X <= other.X &&
  }

  String toString() {
    return '($X, $Y)';
  }
}

var NETWORK = [
'-28189131 593661218'
,'102460950 1038903636'
,'938059973 -816049599'
,'-334087877 -290840615'
,'842560881 -116496866'
,'-416604701 690825290'
,'19715507 470868309'
,'846505116 -694479954'
  ,'1 2'
  ,'0 0'
  ,'2 2'
  ,'1 3'
];


void main() {
    List inputs;
    int N = 8; //int.parse(stdin.readLineSync());
    debug('# home: $N');

    List<Link> networks = new List();
    int minX;
    int maxX;

    for (int i = 0; i < N; i++) {
      inputs = NETWORK[i].split(' '); //stdin.readLineSync().split(' ');
      int X = int.parse(inputs[0]);
      int Y = int.parse(inputs[1]);
      debug('From: $X To: $Y');

      networks.add(new Link(X, Y));

      if (minX == null) {
        minX = X;
        maxX = X;
      }

      if (X < minX) {
        minX = X;
      }
      if (X > maxX) {
        maxX = X;
      }
    }

    debug('networks: $networks');
    networks.sort();
    debug('networks: $networks');

    int median = networks[networks.length ~/ 2].Y;
    debug('median: $median');
    debug('minX: $minX');
    debug('maxX: $maxX');

    int computeDist(Link a, int median) {
      debug('Computing distance b/w $a & $median');
      return (a.Y - median).abs();
    }

    int currentDist = 0;
    for (int i = 0; i < networks.length; i++) {
      currentDist += computeDist(networks[i], median);
      debug('currentDist: $currentDist');
    }

    currentDist += maxX - minX;

    debug('currentDist: $currentDist');
    print('$currentDist');
}