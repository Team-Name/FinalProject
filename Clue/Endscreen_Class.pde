class End {
  // creates a position for the start and instructions button, an image, and a length and width for the rectangles
  PVector s1, s2;
  PImage logo;
  float l, w;
  //creates a constructor with no parameters
  End() {
    //initializes all variables
    s1=new PVector(width/2, 2*height/3);
    s2=new PVector(width/2, 6*height/7);
    logo=loadImage("clue logo.jpg");
    l=200;
    w=50;
  }
  //displays the image, the ending message, and the try again button
  void display() {
    background(0);
    imageMode(CENTER);
    image(logo, width/2, height/4, width/3, height/3);
    textAlign(CENTER, CENTER);
    rectMode(CENTER);
    colorMode(HSB, 360, 100, 100); 
    fill(120, 0, 100);
    rect(s2.x, s2.y, 2*l/3, w/2);
    textSize(50);
    if (won) {
      fill(120, 100, 100);
      text("YOU WIN! CONGRATULATIONS!", s1.x, s1.y);
    }
    if (!won) {
      fill(240, 100, 100);
      text("SORRY, YOU LOSE", s1.x, s1.y);
    }
    textSize(20);
    text("TRY AGAIN", s2.x, s2.y);
  }
  //restarts the game and reinitializes all variables
  void restart() {
    //if the mouse is within the rectangle, the run boolean changes to true
    if (mouseX<s2.x+(l/2)&&mouseX>s2.x-(l/2)&&mouseY<s2.y+(w/2)&&mouseY>s2.y-(w/2)) {
      st = new Start();
      inst = false;
      stage = 0;
      won = false;
      turnP = true;
      showCards = false;
      showCard = false;
      c = new CardPile();
      b = new Board();
      e = new End();
      teacherCards = c.setUpTeachers();
      board = loadImage("clue board.jpg");
      gpic = loadImage("Gerstein.png");
      kpic = loadImage("Kipp.png");
      monpic = loadImage("Monroy.png");
      mospic = loadImage("Moskowitz.png");
      spic = loadImage("Sanservino.png");
      vpic = loadImage("Valley.png");
    }
  }
}

