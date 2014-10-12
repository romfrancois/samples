import 'dart:io';

/**
 * Given a list of words, output the word that scores the most points
 * using the available letters (1 to 7 letters).
 */

/* Wrapup for debugging purpose */
debug(String msg) {
    stderr.writeln(msg);
}

final List<String> ONEPOINT = ['e', 'a', 'i', 'o', 'n', 'r', 't', 'l', 's', 'u'];
final List<String> TWOPOINTS = ['d', 'g'];
final List<String> THREEPOINTS = ['b', 'c', 'm', 'p'];
final List<String> FOURPOINTS = ['f', 'h', 'v', 'w', 'y'];
final List<String> FIVEPOINTS = ['k'];
final List<String> EIGHTPOINTS = ['j', 'x'];
final List<String> TENPOINTS = ['q', 'z'];

final ALPHABET = {
    'ONEPOINT': [ONEPOINT, 1],
    'TWOPOINTS': [TWOPOINTS, 2],
    'THREEPOINTS': [THREEPOINTS, 3],
    'FOURPOINTS': [FOURPOINTS, 4],
    'FIVEPOINTS': [FIVEPOINTS, 5],
    'EIGHTPOINTS': [EIGHTPOINTS, 8],
    'TENPOINTS': [TENPOINTS, 10]
};

class Word {
    String word;
    int points = 0;

    Word(this.word) {
      for (int i = 0; i < word.length; i++) {
        ALPHABET.forEach((key, value) {
          //debug('key: $key | value: $value | point(s): ${value[1]}');
          List<String> currentLetters = value[0];
          String currentLetter = word[i];
          //debug('currentLetter: $currentLetter');

          if (currentLetters.contains(currentLetter)) {
            //debug('Matching letter: $currentLetter | key is: $key');
            int currentPoint = value[1];
            //debug('Points: $currentPoint');
            points += currentPoint;
          }
        });
      }
    }

    String toString() {
      return '$word [$points]';
    }
}

final WORDS = [
  'because'
  ,'first'
  ,'these'
  ,'could'
  ,'which'
];

final LETTERS =['hicquwh'];

void main() {
    int nbWords = 5; //int.parse(stdin.readLineSync());
    //debug('nbWords: $nbWords');

    List<Word> words = new List();
    for (int i = 0; i < nbWords; i++) {
      String currentWord = WORDS[i]; //stdin.readLineSync();
      //debug('currentWord: $currentWord');

      if (currentWord.length <= 7) {
          Word newWord = new Word(currentWord);
          //debug('newWord: $newWord');
          words.add(newWord);
          //debug('Points: ${newWord.points}');
          //print('${newWord.points}');
      }
    }

    String letters = LETTERS[0]; //stdin.readLineSync();
    //debug('letters: $letters');

    RegExp regExp = new RegExp(r"[^"+letters+"]");
    debug('RegExp: ${regExp.pattern}');

    //debug('Before: $words');
    words.sort((a, b) => b.points.compareTo(a.points));
    debug('After: $words');

    String result;

    for (int i = 0; i < words.length; i++) {
      result = words[i].word;


      bool isRegExpInValid = result.contains(regExp);
      if (!isRegExpInValid) {
        //debug('isRegExpInValid: $isRegExpInValid');
//        debug('Winner! => $result');
        break;
      }
    }

    result = result.trim();
    debug('Winner is: $result');
    print('$result');
}
