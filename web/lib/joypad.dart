part of tictactoe;

abstract class Joypad {
  
  void setButtonEvents() {
      
    window.onKeyDown.listen((KeyboardEvent keydown) {
        
        int pressedKey = keydown.which == null ? keydown.charCode : keydown.which;
        
        CustomEvent buttonPressed = new CustomEvent('joypadButtonPressed', 
            detail: pressedKeys(pressedKey));
        
        window.dispatchEvent(buttonPressed);
        
    });
    
  }
  
  String pressedKeys(int pressedKeyCode) {
    
    Map<int, String> keys = new Map<int,String>();
  
    keys[9] = 'BUTTON_TAB'; // Need to capture tab events
    keys[32] = 'BUTTON_DRAW';
    keys[82] = 'BUTTON_RESET';
    
    keys[37] = 'BUTTON_LEFT';
    keys[38] = 'BUTTON_UP';
    keys[39] = 'BUTTON_RIGHT';
    keys[40] = 'BUTTON_DOWN';
    
    if(keys[pressedKeyCode] is String) return keys[pressedKeyCode];
    
    return '';
  }
}