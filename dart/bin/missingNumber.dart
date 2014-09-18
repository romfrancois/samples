import 'dart:io';

debug(String msg) {
    stderr.writeln(msg);
}

// O(n)
int basicImpl(List<int> numbers) {
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] != i) {
      debug('Missing number is: $i');
      return i;
    }
  }
  return -1;
}

// O(n)
int sumDiff(List<int> numbers, int length) {
  int sum1 = 0;
  for (int i = 0; i < numbers.length; i++) {
    sum1 += numbers[i];
  }

  int sum2 = length * (length + 1) ~/ 2;
  return sum2 - sum1;
}

// O(log n)
int binarySearch(List<int> numbers, int length) {
  int left = 0; // beginning of list
  int right = length - 1; // end of list

  while (left <= right) {
    int middle = (right + left) ~/2; // ~/2 == >> 1 to get the middle of the list shifting all elements
    debug('middle: $middle | left: $left | right: $right');

    if(numbers[middle] != middle) {
        if(middle == 0 || numbers[middle - 1] == middle - 1) {
            return middle;
        }
        right = middle - 1;
    }
    else {
        left = middle + 1;
    }
  }

  if(left == length) {
    return length;
  }

  return -1;
}

void main() {
  List<int> numbers = [0, 1, 2, 3, 5];

  debug('basicImpl: ${basicImpl(numbers)}');
  debug('sumDiff: ${sumDiff(numbers, 5)}');
  debug('binarySearch: ${binarySearch(numbers, 5)}');
}