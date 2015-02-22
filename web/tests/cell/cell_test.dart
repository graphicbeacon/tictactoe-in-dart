import 'package:unittest/unittest.dart';
import '../../lib/game.dart';

void main() {

  Cell cell;

  setUp(() {
    cell = new Cell(0, 0);
  });

  tearDown(() {
    cell = null;
  });

  test("Returns the correct row and column", () {

    assert(cell.ROW == 0 && cell.COL == 0);

  });

  test("Sets the appropriate id", () {

    assert(cell.cell.id == "_0_0");

  });

  test("Paints a cell and keeps it final", () {

    cell
        ..paint('X')
        ..paint('O');

    assert(cell.token == 'X');
    assert(cell.cell.disabled == true);

  });

}
