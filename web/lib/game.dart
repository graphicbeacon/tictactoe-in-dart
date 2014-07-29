library tictactoe;

import 'dart:html';

part 'cell.dart';
part 'board.dart';
part 'controller.dart';
part 'gameplayer.dart';

class Game {

    final Board _board = new Board();
    final List<List> _algorithms = [[1,2,3], [4,5,6], [7,8,9], [1,5,9], [3,5,7]];
    final List<Gameplayer> _players = new List<Gameplayer>(2);
        
    bool _isWinner = false;
    bool _isDraw = false;
    int _currentPlayer = 0;
    Controller _controller = new Controller();
    
    Game() {
      _players[0] = new Gameplayer(0, 'X');
      _players[1] = new Gameplayer(0, 'O');
      
      _controller.cancelTabEvents();
    }
    
    void start() {

      // Insert into page
      document.body.children.insert(1, _board.generate());
      
    }
    
    void switchPlayer() {
      if(_currentPlayer == 0) {
        
      } else {
        
      }
    }
    
    void checkWinner() {
      
    }
    
    void checkDraw() {
      
    }
}