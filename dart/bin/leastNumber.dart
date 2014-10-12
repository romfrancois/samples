import 'dart:io';

/**
 * Given a sequence, find out the subset of continuous positive numbers and
 * remove it from the initial input.
 */

/* Wrapup for debugging purpose */
debug(String msg) {
    stderr.writeln(msg);
}

// O(number.length * digit)
String leastNumber(String number, int digit) {
    String leastNumber = number;

    while(digit > 0 && leastNumber.length > 0) {
        int firstDecreasingDigit = getFirstDecreasing(leastNumber);

        if(firstDecreasingDigit >= 0) {
            leastNumber = removeDigit(leastNumber, firstDecreasingDigit);
        }
        else {
            leastNumber = removeDigit(leastNumber, leastNumber.length - 1);
        }

        digit--;
    }

    return leastNumber;
}

int getFirstDecreasing(String number) {
    for(int i = 0; i < number.length - 1; i++) {
        int curDigit = number.codeUnitAt(i) - 0;
        int nextDigit = number.codeUnitAt(i + 1) - 0;
        //debug('curDigit: $curDigit | nextDigit: $nextDigit');

        if(curDigit > nextDigit) {
            return i;
        }
    }

    return -1;
}

String removeDigit(String number, int digitIndex) {
    String result = '';

    if(digitIndex > 0) {
        result = number.substring(0, digitIndex);
    }

    if(digitIndex < number.length - 1) {
        result += number.substring(digitIndex + 1);
    }

    return result;
}


void main() {
  final String number = '24635';
  final int digit = 2;

  debug('leastNumber: ${leastNumber(number, digit)}');
}