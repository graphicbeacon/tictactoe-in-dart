part of tictactoe;

class Controller {
  
  Controller() {
       
  }
  
  void monitorKeyboardEvents() {
      
  }
  
  void cancelTabEvents() {
    document.body.onKeyDown.listen((keydown) {
      var pressedKey = keydown.which == null ? keydown.charCode : keydown.which;
      // If tab key pressed then stop
      if (pressedKey == 9) keydown.preventDefault();
    });
  }
}