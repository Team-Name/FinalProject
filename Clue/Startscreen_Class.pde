class Start {
  // creates a position for the start and instructions button, an image, and a length and width for the rectangles
  PVector s1, s2, s3, s4;
  PImage logo;
  float l, w;
  //creates a constructor with no parameters
  Start() {
    //initializes all variables
    s1=new PVector(width/2, 3*height/4);
    s2=new PVector(width/2, 7*height/8);
    s3=new PVector(width/2, height/32);
    s4=new PVector(width/2, height*.71);
    logo=loadImage("clue logo.jpg");
    l=200;
    w=50;
  }
  //displays the image, the start button, a rectangle with the word start in it, and the instructions button
  void display() {
    background(0);
    imageMode(CENTER);
    image(logo, width/2, height/3, width/2, height/2);
    fill(120, 0, 100);
    rect(s1.x, s1.y, l, w);
    rect(s2.x, s2.y, 2*l/3, w/2);
    fill(0);
    textSize(50);
    text("START", s1.x, s1.y);
    textSize(15);
    text("INSTRUCTIONS", s2.x, s2.y);
  }
  //runs the game
  void changeStage() {
    //if the mouse is within the rectangle, the stage int increase to start game
    if (mouseX<s1.x+(l/2)&&mouseX>s1.x-(l/2)&&mouseY<s1.y+(w/2)&&mouseY>s1.y-(w/2)) {
      stage=1;
    }
  }
  void rules() {
    if (mouseX<s2.x+(l/3)&&mouseX>s2.x-(l/3)&&mouseY<s2.y+(w/4)&&mouseY>s2.y-(w/4)) {
      inst=true;
    }
    if (mouseX<s3.x+(l/2)&&mouseX>s3.x-(l/2)&&mouseY<s3.y+(w/2)&&mouseY>s3.y-(w/2)) {
      inst=false;
    }
  }
  void showRules() {
    background(360, 100, 0);
    fill(360, 0, 100);
    textSize(15);
    text("RULES:\nScroll up and down using the arrow keys. \nAt the beginning of the game, the player receives 5 digital cards. \nEach card will have a picture of one of the following: a suspect, \na room, or a weapon. One of each of those types of cards has been \npreviously set aside as the murderer, the crime scene, and the \nweapon used. The player will have a digital notesheet where he or \nshe can eliminate suspects, weapons, and rooms. Each turn, the \nplayer will roll two dice and move the specified number of spots \nusing the arrow keys. The player cannot occupy or move through \na space occupied by another player. If the player goes into a room, \nhe or she can make a suggestion. Alternatively, if someone is in a \nroom with a portal, he or she can choose to not roll and immediately \njump into the connected room and make a suggestion. When \nsuggesting, the player will pick one suspect, one room, and one \nweapon. The next player will try to disprove that suggestion. If that \nplayer has proof that the suggestion was wrong, they will show one \ncard to disprove the suggestion to only the player that made the \nsuggestion. If they cannot disprove it, the next player will try. \nAfter a suggestion, the player can mark what they learned on their \nnotesheet. After a suggestion or if the player cannot make it into a \nroom with the number he or she rolled, the turn is over. When a \nplayer is ready to definitively identify the murderer, crime scene, \nand weapon, he or she must go to The Office to accuse. Only one \naccusation can be made per game. The player will make their \naccusation, and if they are correct, they will win the game. If the \naccusation is wrong, they lose.", s4.x, s4.y);
    if (keyPressed) {
      if (keyCode==DOWN) {
        s4.y-=10;
      } 
      if (keyCode==UP) {
        s4.y+=10;
      }
    }
    rect(s3.x, s3.y, width, height/16);
    fill(0);
    textSize(25);
    text("BACK", s3.x, s3.y);
  }
}

