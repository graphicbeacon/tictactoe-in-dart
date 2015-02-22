import 'package:unittest/unittest.dart';
import '../../lib/game.dart';

void main() {

  Game game;
  Gameplayer player1;
  Gameplayer player2;

  setUp(() {
    game = new Game('#Stage');
    player1 = game.players[0];
    player2 = game.players[1];
  });

  tearDown(() {
    game = null;
    player1 = null;
    player2 = null;
  });

  test("Initialises two players", () {

    assert(game.players.length == 2);

  });

  test("Sets O token", () {

    Cell cell1 = game.board.cells[0]..paint('O');

    expect('O', cell1.cell.value);

  });

  test("Confirms win and updates players number of wins", () {

    game.updateGameState(0, player1.token);
    game.updateGameState(3, player2.token);
    game.updateGameState(1, player1.token);
    game.updateGameState(5, player2.token);
    game.updateGameState(2, player1.token);

    assert(game.isWinner == true);
    expect(1, player1.numberOfWins);

  });

  test("Game draws when there are no winning combinations", () {

    game.updateGameState(0, player1.token);
    game.updateGameState(1, player2.token);
    game.updateGameState(2, player1.token);
    game.updateGameState(4, player2.token);
    game.updateGameState(3, player1.token);
    game.updateGameState(5, player2.token);
    game.updateGameState(7, player1.token);
    game.updateGameState(6, player2.token);
    game.updateGameState(8, player1.token);

    assert(game.isDraw == true);

  });
}
