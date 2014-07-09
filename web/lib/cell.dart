library tictactoe;

import 'dart:html';

class Cell {
  final int ROW;
  final int COL;
  final String _CELL_CLASS = 'board__cell';
  final String _CELL_HIGHLIGHT_CLASS = 'cell--highlighted';
  
  InputElement cell = new InputElement();
  
  Cell(this.ROW, this.COL) {
    cell..type = 'button'
        ..id = ROW.toString() + '_' + COL.toString()
        ..className = _CELL_CLASS; 
  }
  
  void reset() {
    cell..disabled = false
        ..value = '';
  }
  
  void disable() {
    cell.disabled = true;
  }
  
  void removeHighlight() {
    cell.classes.remove(_CELL_HIGHLIGHT_CLASS);  
  }
  
  void setHighlight() {
    cell.classes.add(_CELL_HIGHLIGHT_CLASS);  
  }
  
  void paint(token) {
    cell.value = token;
  }
}