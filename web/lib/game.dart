library tictactoe;

import 'dart:html';

part 'cell.dart';
part 'board.dart';
part 'controller.dart';
part 'gameplayer.dart';

class Game {

    final Board board = new Board();
    final List<List> _winningCombinations = [[1,2,3], [4,5,6], [7,8,9], [1,5,9], [3,5,7]];
    final List<Gameplayer> players = new List<Gameplayer>(2);
        
    bool isWinner = false;
    bool isDraw = false;
    int _currentPlayer = 0;
    
    Game() {
      players[0] = new Gameplayer(0, 'O');
      players[1] = new Gameplayer(1, 'X');
      
      for(int i = 0; i < board.cells.length; i++) {
          board.cells[i].cell.onClick.listen((MouseEvent clickEvent) {
            updateGameState(i, players[_currentPlayer].token);
          });
      };
    }
    
    void start() {

      // Insert into page
      document.body.children.insert(1, board.generate());
      
    }
    
    void updateGameState(int cellIndex, String playerToken) {
      
      // Don't update if cell is already set with a token, game ended due to win or draw
      if(board.cells[cellIndex].cell.disabled || isWinner || isDraw) return;
      
      // else paint cell with player token
      board.paintSelectedCell(cellIndex, playerToken);
      
      // Check if anyone won
      checkWinner();
      
      // Set turns for each player
      (_currentPlayer == 0) ? ++_currentPlayer : --_currentPlayer;
      
      // Check if anyone drew
      checkDraw();

    }
    
    void checkWinner() {
      
      var playerToken = players[_currentPlayer].token;
      
      _winningCombinations.forEach((List winningCombination) {

        if( board.cells[winningCombination[0] - 1].cell.value == playerToken && 
          board.cells[winningCombination[1] - 1].cell.value == playerToken &&
          board.cells[winningCombination[2] - 1].cell.value == playerToken ) {

          var playerNumber = _currentPlayer + 1;

          //window.alert('the winner is player ${playerNumber}');

          window.console.log('the winner is player ${playerNumber}');

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

        //window.alert('Its a draw!');

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