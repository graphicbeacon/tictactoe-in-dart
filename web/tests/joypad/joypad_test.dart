import 'package:unittest/unittest.dart';
import 'dart:html';
import '../../lib/game.dart';

void main() {

  Game game;

  setUp(() {
    game = new Game('#Stage')..start();
  });

  tearDown(() {
    game = null;  
  });
  
  // TODO: Write joypad implementation tests
  test("Listen for pressed button", () {

  });
}
