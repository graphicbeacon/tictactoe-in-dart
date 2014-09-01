library tictactoe;

import 'dart:html';

part 'cell.dart';
part 'board.dart';
part 'joypad.dart';
part 'gameplayer.dart';

class Game extends Object with Joypad {

    final Board board = new Board();
    final List<List> _winningCombinations = [[1,2,3], [4,5,6], [7,8,9], [1,5,9], [3,5,7]];
    final List<Gameplayer> players = new List<Gameplayer>(2);
    
    bool isWinner = false;
    bool isDraw = false;
    int _currentPlayer = 0;
    
    Game() {
      players[0] = new Gameplayer(0, 'O');
      players[1] = new Gameplayer(1, 'X');
      
      board.cells.forEach((Cell cell) {
        cell.cell.onClick.listen((MouseEvent clickEvent) {
          
          if(cell.cell.disabled == true) return;
          
          updateGameState(cell.index, players[_currentPlayer].token);
        });
      });
    }
    
    void start() {

      // Insert into page
      document.body..classes.add('loaded')
                   ..children.insert(0, board.generate());
      
      setButtonEvents(joypadButtonPressListener);
    }
    
    void joypadButtonPressListener(dynamic joypadButtonPressed) {

        int highlightedCellIndex = board.getActiveCell().index;
            
        switch(joypadButtonPressed.detail) {
          
          case 'BUTTON_RIGHT':
            
            if (highlightedCellIndex < (board.cells.length - 1)) board.highlightSelectedCell(board.getActiveCell().index + 1);
            
            break;
            
          case 'BUTTON_LEFT':
            
            if (highlightedCellIndex > 0) board.highlightSelectedCell(board.getActiveCell().index - 1);
            
            break;
            
          case 'BUTTON_UP':
            
            if (highlightedCellIndex >= 3) board.highlightSelectedCell(board.getActiveCell().index - 3);
            
            break;
            
          case 'BUTTON_DOWN':
            
            if (highlightedCellIndex <= 5) board.highlightSelectedCell(board.getActiveCell().index + 3);
            
            break;
            
          case 'BUTTON_DRAW':
            
            updateGameState(highlightedCellIndex, players[_currentPlayer].token);
            
            break;
            
          case 'BUTTON_RESET':
            
            reset();
            
            break;
            
        }
      
    }
    
    void updateGameState(int cellIndex, String playerToken) {
      
      // Don't update if game ended due to win or draw
      if(isWinner || isDraw) return;
      
      // else paint cell with player token
      board.paintSelectedCell(cellIndex, playerToken);
      
      if(isWinner == false) checkWinner();
      
      // Set turns for each player
      (_currentPlayer == 0) ? ++_currentPlayer : --_currentPlayer;
      
      if(isWinner == false) checkDraw();

    }
    
    void checkWinner() {
      
      var playerToken = players[_currentPlayer].token;
      
      _winningCombinations.forEach((List winningCombination) {

        if( board.cells[winningCombination[0] - 1].token == playerToken && 
          board.cells[winningCombination[1] - 1].token == playerToken &&
          board.cells[winningCombination[2] - 1].token == playerToken) {

          var playerNumber = _currentPlayer + 1;

          window.alert('the winner is player ${playerNumber}');

          print('the winner is player ${playerNumber}');

          // Set winner to true
          isWinner = true;

          // Increment player's number of wins
          ++players[_currentPlayer].numberOfWins; 
          
          board.disableCells();

          window.console.log('Winning combination: ${winningCombination[0]} ${winningCombination[1]} ${winningCombination[2]}');
          window.console.log('Player ${playerNumber} has won ${players[_currentPlayer].numberOfWins} times');

        }

      });
    }
    
    void checkDraw() {
      
      int filledCells = 0;

      board.cells.forEach((Cell cell) {

        if(cell.cell.value != '') filledCells++;
        
      });

      if (filledCells == board.cells.length) {

        window.alert('Its a draw!');

        isDraw = true;

        window.console.log('draw');
      };
      
    }
    
    void reset() {

      board.reset();
      
      isWinner = false;
    
      isDraw = false;
    }
}