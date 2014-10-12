import 'dart:io';

/**
 * The conway sequence is as follow:
 *
 * 1
 * 11
 * 21
 * 1211
 * 111221
 * ...
 */

/* Wrapup for debugging purpose */
debug(String msg) {
    stderr.writeln(msg);
}

void main() {
  /* Starting number can be anything */
  final int originalNumber = 1; //int.parse(stdin.readLineSync());
  debug('Original #: $originalNumber');

  /* Line to display */
  final int lineToDisplay = 5; //int.parse(stdin.readLineSync());
  debug('LineToDisplay: $lineToDisplay');

  Map<int, List<int>> results = new Map();

  List<int> myFirstLine = new List();
  myFirstLine.add(originalNumber);

  results[0] = myFirstLine;

  int cpt = 1;
  int previousNumber = -1;

  for (int i = 1; i < lineToDisplay; i++) {
//    debug("\nCurrent line: $i");

    List<int> previousLine = results[i - 1];
    int previousLineSize = previousLine.length;
//    debug('previousLine: $previousLine | size: ${previousLineSize}');

    if (previousLine != null) {
//      debug('cpt: $cpt');

      previousNumber = previousLine[0];

      List<int> currentLine = new List();
      for (int j = 1; j < previousLine.length; j++) {
        int currentNumber = previousLine[j];
//        debug('previousNumber: $previousNumber | currentNumber: $currentNumber');

        if (previousNumber == currentNumber) {
//          debug('Same number');

          cpt++;
          previousNumber = currentNumber;
        }
        else {
//          debug('Different number');

//          debug('\tAdding cpt: $cpt');
          currentLine.add(cpt);
//          debug('\tAdding number: $previousNumber');
          currentLine.add(previousNumber);

//          debug('Line status: $currentLine @ $i');

          cpt = 1;
          previousNumber = currentNumber;
        }
      }

//      debug('Adding cpt: $cpt');
      currentLine.add(cpt);
//      debug('Adding number...');
      currentLine.add(previousNumber);

//      debug('Line to be added: $currentLine @ $i');
      results[i] = currentLine;

      cpt = 1;
      previousNumber = -1;
    }
  }

  String result = '';
  for (int i = 0; i < results.length; i++) {
    if (i == lineToDisplay - 1) {
      debug("\nOutput line: $i");
      List<int> currentLine = results[i];
      debug('$currentLine');

      for (int j = 0; j < currentLine.length; j++) {
        result += '${currentLine[j]} ';
      }
    }
  }

  result = result.trim();
  debug('$result');

}