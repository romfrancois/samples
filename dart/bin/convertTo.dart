import 'dart:io';
import 'dart:math';

debug(String msg) {
    stderr.writeln(msg);
}

int convertToDecimal(int base, String sequence) {
  debug('Base to convert to: $base');

  debug('Bits to convert: $sequence');

  String reverseSequence = new String.fromCharCodes(sequence.codeUnits.reversed.toList());
  debug('Reversed sequence: $reverseSequence');

  int result = 0;
  for (int i = 0; i < reverseSequence.length; i++) {
    int currentBit = int.parse(reverseSequence[i]);

    result += pow(base, i) * currentBit;
  }

  return result;
}

String convertToBinary(int base, int decimal) {
  debug('Base to convert to: $base');

  debug('Decimal to convert: $decimal');

  String result = '';
  while (decimal != 0) {
    int currentDecimal = decimal ~/ base;
    int remainder = decimal % base;
    debug('currentDecimal: $currentDecimal | remainder: $remainder');

    result += '$remainder';
    decimal = currentDecimal;
  }

  return new String.fromCharCodes(result.codeUnits.reversed.toList());;
}

void main() {

  int base = 2;
  String sequence = '1011';
  debug('convertToDecimal: ${convertToDecimal(base, sequence)}');

  int decimal = 11;
  debug('convertToBinary: ${convertToBinary(base, decimal)}');
}