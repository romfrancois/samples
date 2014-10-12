import 'dart:io';

/**
 * Given a list of phone numbers, give the minimal Node to cover them all.
 * This example illustrates how to put numbers (or anything else) to a tree.
 */

/* Wrapup for debugging purpose */
debug(String msg) {
    stderr.writeln(msg);
}

class Node {
  String id = '';
  List<Node> children = new List();

  Node([this.id]);

  Node subNode(String c){
    if(children != null) {
      for(Node currentChild in children){
        if(currentChild.id == c){
          return currentChild;
        }
      }
    }

    return null;
  }
}

void main() {
  int N = 3; //int.parse(stdin.readLineSync());
  debug('#: $N');

  var NUMBERS = [
    '0467123456'
    ,'112'
    ,'115'
    ,'0123456789'
    , '0123'
    ,'0123456789'
    , '1123456789'
    , '0412578440'
    , '0412199803'
    , '0468892011'
    , '0467123456'
  ];

  Node root = new Node('/');
  int numberOfElements = 0;

  for (int i = 0; i < N; i++) {
    String currentPhoneNumber = NUMBERS[i]; //stdin.readLineSync();
    debug('\ncurrentPhoneNumber: $currentPhoneNumber');

    Node current = root;

    if(!currentPhoneNumber.isEmpty) {
      for(int i = 0; i < currentPhoneNumber.length; i++){
        String currentChar = currentPhoneNumber[i];
        debug('currentChar: $currentChar');

        Node child = current.subNode(currentChar);

        if(child != null) {
          current = child;
        }
        else{
          current.children.add(new Node(currentChar));
          current = current.subNode(currentChar);
          numberOfElements++;
        }
      }
    }
  }

  debug('\nnumberOfElements: $numberOfElements');
}