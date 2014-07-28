part of tictactoe;

class Board {
  
  final int _ROWS = 3;
  final int _COLS = 3;
  final String _BOARDCLASS = 'board';
  
  List<Cell> _cells = new List<Cell>();
  
  get cellsLength => _cells.length;
  
  Board() {
    _createCells();
  }
  
  void _createCells() {
    for(int row = 0; row < _ROWS; row++) {
      for(int col = 0; col < _COLS; col++) {
        _cells.add(new Cell(row, col));
      }
    }
  }
  
  DivElement generate() {
    var div = new DivElement()
           ..className = _BOARDCLASS;
    
    // highlight first cell
    _cells[0].setHighlight();
    
    for (Cell cell in _cells) {
      // Add mouse hover event
      cell.cell.onMouseOver.listen(mouseOverEventCallback);
      
      div.children.add(cell.cell);
    }
    
    return div;
  }
  
  void mouseOverEventCallback (MouseEvent mouseover) {
    var cell = mouseover.target as InputElement;
    
    highlightSelectedCell(cell.id);
  }
  
  void highlightSelectedCell (String cellId) {
    
    _cells.forEach((Cell cell) {

      if(cell.cell.id == cellId) {
        cell.setHighlight();
      } else {
        cell.removeHighlight();
      }
      
    });
  }
  
  Cell getActiveCell() {
    return _cells.singleWhere((Cell cell) => cell.isActive == true);
  }
  
}