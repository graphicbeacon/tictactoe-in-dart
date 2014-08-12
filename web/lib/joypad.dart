part of tictactoe;

abstract class Joypad {
  
  void setButtonEvents(Function joypadButtonPressedCallback) {
      
    window.onKeyDown.listen((KeyboardEvent keydown) {
        
        int keyPressed = keydown.which == null ? keydown.charCode : keydown.which;
        
        CustomEvent pressed = new CustomEvent('joypadButtonPressed', 
            detail: buttonPressed(keyPressed));
        
        window.dispatchEvent(pressed);
        
    });
    
    window.on['joypadButtonPressed'].listen(joypadButtonPressedCallback);
  }
  
  String buttonPressed(int pressed) {
    
    Map<int, String> buttons = new Map<int,String>();
  
    buttons[9] = 'BUTTON_TAB'; // Need to capture tab events
    buttons[32] = 'BUTTON_DRAW';
    buttons[82] = 'BUTTON_RESET';
    
    buttons[37] = 'BUTTON_LEFT';
    buttons[38] = 'BUTTON_UP';
    buttons[39] = 'BUTTON_RIGHT';
    buttons[40] = 'BUTTON_DOWN';
    
    if(buttons[pressed] is String) return buttons[pressed];
    
    return '';
  }
}