public class Water {
  //Images
  PImage ocean;
  
  float waterHeight = height;
  float waterSpeed;
  
  public Water() {
    //Load image
    ocean = loadImage("images/Ocean3.png");
    
    //Resize image
    ocean.resize(width, (width*15)/10);
  }

  void show() {
    //Draw image
    image(ocean, 0, waterHeight);
  }
  
  void move(float newSpeed) {
    //Set water speed
    waterSpeed = height*0.001*newSpeed;
    
    //Move water
    waterHeight += waterSpeed;
  }
  
  float waterHeight(){
    return(waterHeight/height);
  }
}
