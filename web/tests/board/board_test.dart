import 'dart:html';
import 'package:unittest/unittest.dart';
import '../../lib/game.dart';

void main() {

  Board board;
  DivElement generatedBoard;

  setUp(() {
    board = new Board();
    generatedBoard = new Board().generate();
  });

  tearDown(() {
    board = null;
    generatedBoard = null;
  });

  test("Generates 9 cells", () {

    assert(board.cells.length == 9);

  });


  test("Board is visible in document", () {

    document.body.children.insert(1, generatedBoard);

    assert(document.querySelector('div').classes.contains('board') == true);

  });


  test("Removes and adds highlighted class to selected cell", () {

    Event e = new Event.eventType('MouseEvent', 'mouseover');

    document.querySelector('.board__cell:nth-child(2)').dispatchEvent(e);

    assert(document.querySelector('.board__cell:nth-child(2)').className.contains('cell--highlighted'));

  });

}
