public class Door {
  //Images
  PImage doorL;
  PImage doorR;
  PImage doorFrame;

  int doorWidth;
  int doorHeight;

  float doorPos = 0;
  float doorSpeed;
  
  float newPos;

  public Door() {
    
    //Load images
    doorL = loadImage("images/doorL3.png");
    doorR = loadImage("images/doorRWindow.png");
    doorFrame = loadImage("images/doorFrame.png");
    
    //Images sizes
    doorWidth = width;
    doorHeight = (width*15)/10;
    
    //Resize images
    doorL.resize(doorWidth, doorHeight);
    doorR.resize(doorWidth, doorHeight);
    doorFrame.resize(doorWidth, doorHeight);
    
    //Set door speed
    doorSpeed = width*0.01;
  }

  void show() {
    
    //Draw images
    image(doorL, -doorPos, 0);
    image(doorR, doorPos, 0);
    image(doorFrame, 0, 0);
  }
  
  void set(float newPosOriginal) {
    
    //Convert form decimal to real position
    newPos = newPosOriginal*(width/3.4);
    
    //Move door to new position
    if(doorPos < newPos){
    doorPos += doorSpeed;
    }
    if(doorPos > newPos){
    doorPos -= doorSpeed;
    }
    
  }
  
  float doorPos(){
    return(float(round((doorPos/(width/3.4)) * 100))/100.0);
  }
  
}
