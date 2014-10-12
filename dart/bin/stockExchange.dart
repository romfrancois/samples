import 'dart:io';

/**
 * Given a list of numbers, output the maximal loss
 * (expressed negatively if there is a loss), otherwise 0.
 */

/* Wrapup for debugging purpose */
debug(String msg) {
    stderr.writeln(msg);
}

var VALUES = [
  '1 2 4 4 5'
  ,'3 2 4 2 1 5'
  ,'5 3 4 2 3 1'
  ,'3 4 7 9 10'
];

void main() {
    int n = 5; //int.parse(stdin.readLineSync());
    debug('# values: $n');

    List vs = VALUES[3].split(' '); //stdin.readLineSync().split(' ');
    debug('VALUES: $vs');

    int max;
    int min;
    int preValue;
    int currentValue = int.parse(vs[0]);

    bool stillGrowing = true;

    if (max == null || min == null) {
//      debug('init');

      max = currentValue;
      min = currentValue;
      preValue = currentValue;
    }

    for (int i = 1; i < vs.length; i++) {
      currentValue = int.parse(vs[i]);
//      debug('currentValue: $currentValue');

      if ( i == vs.length - 1 && currentValue >= preValue) {
//        debug('value not taken!');
      }
      else {
        if (currentValue < min) {
          min = currentValue;
        }
        if (currentValue > max) {
          max = currentValue;
        }
      }
      if (currentValue >= preValue) {
//        debug('true');
        stillGrowing = stillGrowing && true;
      }
      else {
//        debug('false');
        stillGrowing = stillGrowing && false;
      }

      preValue = currentValue;
    }

//    debug('min: $min');
//    debug('max: $max');

    int answer = max - min;
    answer = (answer > 0) ? -answer : answer;
//    debug('Answer: $answer');

//    debug('stillGrowing: $stillGrowing');
    if (stillGrowing == true) {
//      debug('stillGrowing');
      answer = 0;
    }

    debug('answer is: $answer');
    print('$answer');
}