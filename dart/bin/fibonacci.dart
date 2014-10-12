import 'dart:io';

/**
 * Several ways to compute the very well known Fib sequence.
 */

/* Wrapup for debugging purpose */
debug(String msg) {
    stderr.writeln(msg);
}


//int fibonacci(int number) {
//  if (number == 0) {
//    return 0;
//  }
//  else if (number == 1) {
//    return 1;
//  }
//  else return fibonacci(number - 1) + fibonacci(number - 2);
//}

// O(n)
int fibonacci(int number) {
  List<int> result = [0, 1];

  if(number < 2) {
      return result[number];
  }

  int  fibNMinusOne = 1;
  int  fibNMinusTwo = 0;
  int  fibN = 0;

  for(int i = 2; i <= number; i++) {
    fibN = fibNMinusOne + fibNMinusTwo;

    fibNMinusTwo = fibNMinusOne;
    fibNMinusOne = fibN;
  }

  return fibN;
}

// O(log n) can be achieved using matrix

void main() {
  int input = 15;

  debug('Result: ${fibonacci(input)}');
}