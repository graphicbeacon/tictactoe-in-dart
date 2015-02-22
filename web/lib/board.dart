part of tictactoe;

class Board {

  final int _ROWS = 3;
  final int _COLS = 3;
  final String _BOARDCLASS = 'board';

  List<Cell> cells = new List<Cell>();

  Board() {
    _createCells();
  }

  void _createCells() {
    for (int row = 0; row < _ROWS; row++) {
      for (int col = 0; col < _COLS; col++) {
        cells.add(new Cell(row, col));
      }
    }
  }

  DivElement generate() {
    var div = new DivElement()..className = _BOARDCLASS;

    // highlight first cell
    cells[0].setHighlight();

    for (int i = 0; i < cells.length; i++) {
      // Add mouse hover event
      cells[i]
          ..index = i
          ..cell.onMouseOver.listen((MouseEvent mouseover) {
            highlightSelectedCell(cells[i].index);
          });

      div.children.add(cells[i].cell);
    }

    return div;
  }

  void disableCells() {

    cells.forEach((Cell cell) {
      cell.disable();
    });
  }

  void reset() {

    cells.forEach((Cell cell) {
      cell.reset();
    });
  }

  void highlightSelectedCell(int cellIndex) {

    getActiveCell()..removeHighlight();

    cells.singleWhere((Cell cell) => cell.index == cellIndex)..setHighlight();

  }

  void paintSelectedCell(int cellIndex, String playerToken) {
    cells[cellIndex].paint(playerToken);
  }

  Cell getActiveCell() {
    return cells.singleWhere((Cell cell) => cell.isActive == true);
  }

}
