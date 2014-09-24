import 'dart:io';

debug(String msg) {
    stderr.writeln(msg);
}

void main() {
  int numberOfParticipants = int.parse(stdin.readLineSync());
  debug('numberOfParticipants: $numberOfParticipants');

  int price = int.parse(stdin.readLineSync());
  debug('price: $price');

  List<int> budgets = new List();

  int currentBudget = int.parse(stdin.readLineSync());
  budgets.add(currentBudget);
  int highest = currentBudget;
  int lowest = currentBudget;
  int sumBudgets = currentBudget;

  for (int i = 0; i < numberOfParticipants - 1; i++) {
    currentBudget = int.parse(stdin.readLineSync());
    budgets.add(currentBudget);
    sumBudgets += currentBudget;

    if (currentBudget > highest) {
        highest = currentBudget;
    }

    if (currentBudget < lowest) {
        lowest = currentBudget;
    }
  }

  budgets.sort();
  debug('budgets: $budgets');

  if ( sumBudgets < price) {
      print('IMPOSSIBLE');
      return;
  }

    int rest2Pay = price;
    for (int i = 0; i < budgets.length - 1; i ++) {
        int mean = rest2Pay ~/ numberOfParticipants;

        int currentBudget = budgets[i];
        if (currentBudget <= mean) {
            print('$currentBudget');
            rest2Pay -= currentBudget;
        }
        else {
            print('$mean');
            rest2Pay -= mean;
        }
        numberOfParticipants--;
    }

    // debug('rest2Pay: $rest2Pay');

    int lastBudget = budgets[budgets.length - 1];
    // debug('lastBudget: $lastBudget');
    int finalPrice = price - rest2Pay - lastBudget;
    print('$rest2Pay');
}