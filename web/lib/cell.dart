part of tictactoe;

class Cell {
  final int ROW;
  final int COL;
  final String _CELL_CLASS = 'board__cell';
  final String _CELL_HIGHLIGHT_CLASS = 'cell--highlighted';
  
  String token;
  bool isActive = false;
  int index;
  
  InputElement cell = new InputElement();
  
  Cell(this.ROW, this.COL) {
    cell..type = 'button'
        ..id = '_${ROW}_${COL}'
        ..className = _CELL_CLASS; 
  }
  
  void reset() {
    token = null;
    
    cell..disabled = false
        ..value = '';
  }
  
  void disable() {
    cell.disabled = true;
  }
  
  void removeHighlight() {
    cell.classes.remove(_CELL_HIGHLIGHT_CLASS);  
    isActive = false;
  }
  
  void setHighlight() {
    isActive = true;
    cell.classes.add(_CELL_HIGHLIGHT_CLASS);
  }
  
  void paint(String paintToken) {
    
    if (token != null) return;
        
    cell.value = token = paintToken;
    disable();
  }
}