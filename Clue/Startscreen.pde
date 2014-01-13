class Start {
  // creates a position for the start and instructions button, an image, and a length and width for the rectangles
  PVector s1, s2;
  PImage logo;
  float l, w;
  //creates a constructor with no parameters
  Start() {
    //initializes all variables
    s1=new PVector(width/4, 3*height/4);
    s2=new PVector(3*width/4, 3*height/4);
    logo=loadImage("clue logo.jpg");
    l=200;
    w=50;
  }
  //displays the image, the start button, a rectangle with the word start in it, and the instructions button
  void display() {
    imageMode(CENTER);
    image(logo, width/2, height/3, width/2, height/2);
    fill(120, 100, 100);
    rect(s1.x, s1.y, l, w);
    rect(s2.x, s2.y, l, w);
    fill(0);
    textSize(50);
    text("START", s1.x, s1.y);
    textSize(25);
    text("INSTRUCTIONS",s2.x,s2.y);
  }
  //runs the game
  void changeRun() {
    //if the mouse is within the rectangle, the run boolean changes to true
    if (mouseX<s1.x+(l/2)&&mouseX>s1.x-(l/2)&&mouseY<s1.y+(l/2)&&mouseY>s1.y-(l/2)) {
      run=true;
    }
  }
  void rules(){
    if (mouseX<s2.x+(l/2)&&mouseX>s2.x-(l/2)&&mouseY<s2.y+(l/2)&&mouseY>s2.y-(l/2)) {
      background(0);
      fill(255);
      text("RULES:\nHI",width/2,height/2);
    }
  }
}

