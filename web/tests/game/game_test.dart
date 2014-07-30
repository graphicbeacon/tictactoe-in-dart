import 'package:unittest/unittest.dart';
import '../../lib/game.dart';

void main () {
  
  var game = new Game();
  
  test("Initialises two players", () {
    
    assert(game.players.length == 2);
    
  });
  
  test("Sets O token", () {
    
    var cell1 = game.board.cells[0];
        cell1.paint('O');
        
    expect('O', cell1.cell.value);
  });
  
  test("Confirms win and updates players number of wins", () {
    
    var game2 = new Game();
    var player1 = game2.players[0];
    var player2 = game2.players[1];

    game2.updateGameState(0, player1.token);
    game2.updateGameState(3, player2.token);
    game2.updateGameState(1, player1.token);
    game2.updateGameState(5, player2.token);
    game2.updateGameState(2, player1.token);

    assert(game2.isWinner == true);
    expect(1, player1.numberOfWins);
        
  });
  
  test("Game draws when there are no winning combinations", () {
    
    var game3 = new Game();
    var player1 = game3.players[0];
    var player2 = game3.players[1];

    game3.updateGameState(0, player1.token);
    game3.updateGameState(1, player2.token);
    game3.updateGameState(2, player1.token);
    game3.updateGameState(3, player2.token);
    game3.updateGameState(4, player1.token);
    game3.updateGameState(5, player2.token);
    game3.updateGameState(7, player1.token);
    game3.updateGameState(6, player2.token);
    game3.updateGameState(8, player1.token);
    
    assert(game3.isDraw == true);
  });
}