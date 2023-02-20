import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

Button[] buttons;


void initButtons() {
  
  arduino = new Arduino(this, Arduino.list()[2], 57600);
  buttons = new Button[4];
  for( int i = 0; i < 4 ; i++) {
    
    buttons[i] = new Button(i*2+2, i);
    
  }
  buttons[0] = new Button(3, 0);
  buttons[1] = new Button(4, 1);
  buttons[2] = new Button(5, 2);
  buttons[3] = new Button(7, 3);

}

public static void rotateArray(int[] arr) {
    int last = arr[arr.length - 1];
    for (int i = arr.length - 1; i > 0; i--) {
        arr[i] = arr[i - 1];
    }
    arr[0] = last;
}


public class Button {

  int  buttonPin, id;
  
  Button (int tempBut, int tempId) {
    id = tempId;
    buttonPin = tempBut;
    arduino.pinMode(buttonPin, Arduino.INPUT_PULLUP);
    
  }
  
  void update() {
    
  
  }
  
  boolean hasBeenPressed() {
    println(arduino.digitalRead(buttonPin));
    return arduino.digitalRead(buttonPin) == Arduino.LOW;
    
  }
  
}
