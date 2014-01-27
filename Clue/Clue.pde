//music
import ddf.minim.*;
Minim minim;
AudioPlayer music;
int stage, suggestStage, accuseStage;
Start st;
boolean inst, turnP, won, showCards, suggestionScreen, accusationScreen, showCard;
CardPile c;
ArrayList<Card> teacherCards;
Card[] murder;
Board b;
Player p;
ComputerPlayer[] cp;
int gers, sans, kipp, mosk, monr, vall=0;
int id, whir, deaf, blin, expl, nullW, supe, answ=0;
int audi, fitn, mmc, newR, seni, vallR, pint, pant, fres=0;
PFont font;
PImage board, gpic, kpic, monpic, mospic, spic, vpic;
Card[][] playerCards = new Card[4][5];
Card revealed;

void setup() {
  //settings
  size(930, 750);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  minim = new Minim(this);
  music = minim.loadFile("CreepyMusic.mp3");
  music.play();
  music.loop();
  font=loadFont("AmericanTypewriter-80.vlw");
  textFont(font);
  st = new Start();
  inst = false;
  stage = 0;
  won = false;
  turnP = true;
  showCards = false;
  showCard = false;
  c = new CardPile();
  b = new Board();
  teacherCards = c.setUpTeachers();
  board = loadImage("clue board.jpg");
  gpic = loadImage("Gerstein.png");
  kpic = loadImage("Kipp.png");
  monpic = loadImage("Monroy.png");
  mospic = loadImage("Moskowitz.png");
  spic = loadImage("Sanservino.png");
  vpic = loadImage("Valley.png");
}

void draw() {
  if (stage == 0) { //start screen
    if (inst) {
      st.showRules();
    }
    else {
      st.display();
    }
  }
  else if (showCards) {
    showCards = true;
    background(0);
    notesheet();
    textSize(40);
    fill(255);
    textAlign(LEFT, UP);
    text("Click anywhere to continue", 10, 40);
    text("Your Cards:", 10, 120);
    int pos = 120;
    for (Card c : playerCards[0]) {
      pos += 50;
      text(c.detail, 10, pos);
    }
  }
  else if (suggestionScreen) {
    if (suggestStage == 0) {
      background(0);
      textSize(40);
      fill(255);
      textAlign(LEFT, UP);
      text("Choose a suspect", 10, 40);
      text("Ms. Gerstein\nMr. Sanservino\nMrs. Kipp\nMr. Moskowitz\nMrs. Monroy\nMrs. Valley", 10, 120);
    }
    else if (suggestStage == 1) {
      background(0);
      textSize(40);
      fill(255);
      textAlign(LEFT, UP);
      text("Choose a weapon", 10, 40);
      text("ID\nWhirligig\nDeafening Bell\nBlinky the Robot\nExploding Printer Jam\nNull Pointer Exception\nSupervolcano\nAnswer That Wasn't In The PDF", 10, 120);
    }
    else if (suggestStage == 2) {
      revealed = p.reveal(p.suggestion);
      p.movesLeft = 0;
      turnP = false;
      suggestionScreen = false;
      showCard = true;
    }
  }
  else if (showCard) {
    background(0);
    textSize(40);
    fill(255);
    textAlign(LEFT, UP);
    text("Card Revealed:", 10, 120);
    text(revealed.detail, 10, 170);
  }
  else if (accusationScreen) {
    if (accuseStage == 0) {
      background(0);
      textSize(40);
      fill(255);
      textAlign(LEFT, UP);
      text("Choose a suspect", 10, 40);
      text("Ms. Gerstein\nMr. Sanservino\nMrs. Kipp\nMr. Moskowitz\nMrs. Monroy\nMrs. Valley", 10, 120);
    }
    else if (accuseStage == 1) {
      background(0);
      textSize(40);
      fill(255);
      textAlign(LEFT, UP);
      text("Choose a weapon", 10, 40);
      text("ID\nWhirligig\nDeafening Bell\nBlinky the Robot\nExploding Printer Jam\nNull Pointer Exception\nSupervolcano\nAnswer That Wasn't In The PDF", 10, 120);
    }
    else if (accuseStage == 2) {
      background(0);
      textSize(40);
      fill(255);
      textAlign(LEFT, UP);
      text("Choose a room", 10, 40);
      text("Auditorium\nFitness Center\nMMC\nNew Room\nSenior Lounge\nMrs. Valley's Room\nMrs. Pinto's Room\nMr. Pantaleo's Room\nFreshman Tech Room", 10, 120);
    }
    else if (accuseStage == 3) {
      stage++;
      if (p.checkAccusation(p.accusation)) {
        won = true;
      }
      accusationScreen = false;
    }
  }
  else if (stage == 1) { //choosing a teacher to play with
    ArrayList<String> teachers = new ArrayList<String>();
    background(0);
    textSize(80);
    textAlign(CENTER, UP);
    fill(360);
    text("Please Choose One", width/2, 700);
    image(gpic, width/4, (height-80)/3);
    image(kpic, 2*width/4, (height-80)/3);
    image(monpic, 3*width/4, (height-80)/3);
    image(mospic, width/4, 2*(height-80)/3);
    image(spic, 2*width/4, 2*(height-80)/3);
    image(vpic, 3*width/4, 2*(height-80)/3);
    if (mousePressed) {
      if (dist(width/4, (height-80)/3, mouseX, mouseY) <= 90) {
        teachers.add("Ms. Gerstein");
      }
      else if (dist(2*width/4, (height-80)/3, mouseX, mouseY) <= 90) {
        teachers.add("Mrs. Kipp");
      }
      else if (dist(3*width/4, (height-80)/3, mouseX, mouseY) <= 90) {
        teachers.add("Mrs. Monroy");
      }
      else if (dist(width/4, 2*(height-80)/3, mouseX, mouseY) <= 90) {
        teachers.add("Mr. Moskowitz");
      }
      else if (dist(2*width/4, 2*(height-80)/3, mouseX, mouseY) <= 90) {
        teachers.add("Mr. Sanservino");
      }
      else if (dist(3*width/4, 2*(height-80)/3, mouseX, mouseY) <= 90) {
        teachers.add("Mrs. Valley");
      }
    }
    if (teachers.size() != 0) {
      murder = c.getMurder();
      int i = 0;
      int j = 0;
      Card nextCard = c.getRandomCard();
      while (nextCard != null) {
        playerCards[i][j] = nextCard;
        j++;
        if (j == 5) {
          j = 0;
          i++;
        }
        nextCard = c.getRandomCard();
      }
      while (true) {
        String nextT = teacherCards.get(int(random(teacherCards.size()))).detail;
        boolean inArray = false;
        for (String t : teachers) {
          if (t.equals(nextT)) {
            inArray = true;
          }
        }
        if (!inArray) {
          teachers.add(nextT);
        }
        if (teachers.size() == 4) {
          break;
        }
      } 
      p = new Player(new PVector(9, 24), playerCards[0], teachers.get(0));
      cp = new ComputerPlayer[3];
      cp[0] = new ComputerPlayer(new PVector(0, 5), playerCards[1], teachers.get(1), 0);
      cp[1] = new ComputerPlayer(new PVector(16, 0), playerCards[2], teachers.get(2), 1);
      cp[2] = new ComputerPlayer(new PVector(23, 17), playerCards[3], teachers.get(3), 2);
      showCards = true;
    }
  }
  else if (stage == 2) { //actual game
    //display the picture of the board and sidebar and teacher pieces on board
    background(0);
    imageMode(CORNER);
    image(board, 0, 0);
    p.display();
    notesheet();
    for (ComputerPlayer i : cp) {
      i.display();
    }
    if (turnP) {
      p.move();
    }
    else {//computer players move (need a timer otherwise this would be too fast)
      for (ComputerPlayer i : cp) {
        i.move();
      }
      turnP = true;
    }
  }
  else { //end game
    //also display correct murder cards and the winner (if someone accused right)
    //restart
    println(won);
  }
}

void keyReleased() {
  if (turnP && keyCode >= 37 && keyCode <= 40) {
    int direction = keyCode;
    if (b.canMove(p.loc, direction)) {
      if (direction == LEFT) {
        p.loc.x--;
      }
      else if (direction == RIGHT) {
        p.loc.x++;
      }
      else if (direction == UP) {
        p.loc.y--;
      }
      else {
        p.loc.y++;
      }
      p.movesLeft--;
    }
    if (p.movesLeft == 0) {
      turnP = false;
    }
  }
}

void mouseClicked() {
  if (suggestionScreen) {
    if (suggestStage == 0) {
      if (mouseY > 85 && mouseY < 123) {
        p.suggestion[1] = new Card(0, "Ms. Gerstein");
        suggestStage++;
      }
      else if (mouseY > 146 && mouseY < 183) {
        p.suggestion[1] = new Card(0, "Mr. Sanservino");
        suggestStage++;
      }
      else if (mouseY > 207 && mouseY < 251) {
        p.suggestion[1] = new Card(0, "Mrs. Kipp");
        suggestStage++;
      }
      else if (mouseY > 266 && mouseY < 303) {
        p.suggestion[1] = new Card(0, "Mr. Moskowitz");
        suggestStage++;
      }
      else if (mouseY > 327 && mouseY < 369) {
        p.suggestion[1] = new Card(0, "Mrs. Monroy");
        suggestStage++;
      }
      else if (mouseY > 387 && mouseY < 431) {
        p.suggestion[1] = new Card(0, "Mrs. Valley");
        suggestStage++;
      }
    }
    else if (suggestStage == 1) {
      if (mouseY > 85 && mouseY < 123) {
        p.suggestion[2] = new Card(2, "ID");
        suggestStage++;
      }
      else if (mouseY > 146 && mouseY < 183) {
        p.suggestion[2] = new Card(2, "Whirligig");
        suggestStage++;
      }
      else if (mouseY > 207 && mouseY < 251) {
        p.suggestion[2] = new Card(2, "Deafening Bell");
        suggestStage++;
      }
      else if (mouseY > 266 && mouseY < 303) {
        p.suggestion[2] = new Card(2, "Blinky the Robot");
        suggestStage++;
      }
      else if (mouseY > 327 && mouseY < 369) {
        p.suggestion[2] = new Card(2, "Exploding Printer Jam");
        suggestStage++;
      }
      else if (mouseY > 387 && mouseY < 431) {
        p.suggestion[2] = new Card(2, "Null Pointer Exception");
        suggestStage++;
      }
      else if (mouseY > 448 && mouseY < 481) {
        p.suggestion[2] = new Card(2, "Supervolcano");
        suggestStage++;
      }
      else if (mouseY > 506 && mouseY < 545) {
        p.suggestion[2] = new Card(2, "Answer That Wasn't In The PDF");
        suggestStage++;
      }
    }
  }
  if (accusationScreen) {
    if (accuseStage == 0) {
      if (mouseY > 85 && mouseY < 123) {
        p.accusation[1] = new Card(0, "Ms. Gerstein");
        accuseStage++;
      }
      else if (mouseY > 146 && mouseY < 183) {
        p.accusation[1] = new Card(0, "Mr. Sanservino");
        accuseStage++;
      }
      else if (mouseY > 207 && mouseY < 251) {
        p.accusation[1] = new Card(0, "Mrs. Kipp");
        accuseStage++;
      }
      else if (mouseY > 266 && mouseY < 303) {
        p.accusation[1] = new Card(0, "Mr. Moskowitz");
        accuseStage++;
      }
      else if (mouseY > 327 && mouseY < 369) {
        p.accusation[1] = new Card(0, "Mrs. Monroy");
        accuseStage++;
      }
      else if (mouseY > 387 && mouseY < 431) {
        p.accusation[1] = new Card(0, "Mrs. Valley");
        accuseStage++;
      }
    }
    else if (accuseStage == 1) {
      if (mouseY > 85 && mouseY < 123) {
        p.accusation[2] = new Card(2, "ID");
        accuseStage++;
      }
      else if (mouseY > 146 && mouseY < 183) {
        p.accusation[2] = new Card(2, "Whirligig");
        accuseStage++;
      }
      else if (mouseY > 207 && mouseY < 251) {
        p.accusation[2] = new Card(2, "Deafening Bell");
        accuseStage++;
      }
      else if (mouseY > 266 && mouseY < 303) {
        p.accusation[2] = new Card(2, "Blinky the Robot");
        accuseStage++;
      }
      else if (mouseY > 327 && mouseY < 369) {
        p.accusation[2] = new Card(2, "Exploding Printer Jam");
        accuseStage++;
      }
      else if (mouseY > 387 && mouseY < 431) {
        p.accusation[2] = new Card(2, "Null Pointer Exception");
        accuseStage++;
      }
      else if (mouseY > 448 && mouseY < 481) {
        p.accusation[2] = new Card(2, "Supervolcano");
        accuseStage++;
      }
      else if (mouseY > 506 && mouseY < 545) {
        p.accusation[2] = new Card(2, "Answer That Wasn't In The PDF");
        accuseStage++;
      }
    }
    else if (accuseStage == 2) {
      if (mouseY > 85 && mouseY < 123) {
        p.accusation[0] = new Card(1, "Auditorium");
        accuseStage++;
      }
      else if (mouseY > 146 && mouseY < 183) {
        p.accusation[0] = new Card(1, "Fitness Center");
        accuseStage++;
      }
      else if (mouseY > 207 && mouseY < 251) {
        p.accusation[0] = new Card(1, "MMC");
        accuseStage++;
      }
      else if (mouseY > 266 && mouseY < 303) {
        p.accusation[0] = new Card(1, "New Room");
        accuseStage++;
      }
      else if (mouseY > 327 && mouseY < 369) {
        p.accusation[0] = new Card(1, "Senior Lounge");
        accuseStage++;
      }
      else if (mouseY > 387 && mouseY < 431) {
        p.accusation[0] = new Card(1, "Mrs. Valley's Room");
        accuseStage++;
      }
      else if (mouseY > 448 && mouseY < 481) {
        p.accusation[0] = new Card(1, "Mrs. Pinto's Room");
        accuseStage++;
      }
      else if (mouseY > 506 && mouseY < 545) {
        p.accusation[0] = new Card(1, "Mr. Pantaleo's Room");
        accuseStage++;
      }
      else if (mouseY > 506 && mouseY < 545) {
        p.accusation[0] = new Card(1, "Freshman Tech Room");
        accuseStage++;
      }
    }
  }
}


void mousePressed() {
  if (stage == 0) {
    st.changeStage(); 
    st.rules();
  }
  else if (stage == 1 && showCards && mouseX < 666) {
    stage++;
    showCards = false;
  }
  else if (stage == 2 && showCard && mouseX < 666) {
    showCard = false;
  }
  if (stage>=1) {
    if (mouseX>=666) {
      if (mouseY>height*1/26 &&mouseY<height*2/26) {
        gers++;
        if (gers==3) {
          gers=0;
        }
      }
      if (mouseY>height*2/26 &&mouseY<height*3/26) {
        sans++;
        if (sans==3) {
          sans=0;
        }
      }
      if (mouseY>height*3/26 &&mouseY<height*4/26) {
        kipp++;
        if (kipp==3) {
          kipp=0;
        }
      }
      if (mouseY>height*4/26 &&mouseY<height*5/26) {
        mosk++;
        if (mosk==3) {
          mosk=0;
        }
      }
      if (mouseY>height*5/26 &&mouseY<height*6/26) {
        monr++;
        if (monr==3) {
          monr=0;
        }
      }
      if (mouseY>height*6/26 &&mouseY<height*7/26) {
        vall++;
        if (vall==3) {
          vall=0;
        }
      }
      if (mouseY>height*8/26 &&mouseY<height*9/26) {
        id++;
        if (id==3) {
          id=0;
        }
      }
      if (mouseY>height*9/26 &&mouseY<height*10/26) {
        whir++;
        if (whir==3) {
          whir=0;
        }
      }
      if (mouseY>height*10/26 &&mouseY<height*11/26) {
        deaf++;
        if (deaf==3) {
          deaf=0;
        }
      }
      if (mouseY>height*11/26 &&mouseY<height*12/26) {
        blin++;
        if (blin==3) {
          blin=0;
        }
      }
      if (mouseY>height*12/26 &&mouseY<height*13/26) {
        expl++;
        if (expl==3) {
          expl=0;
        }
      }
      if (mouseY>height*13/26 &&mouseY<height*14/26) {
        nullW++;
        if (nullW==3) {
          nullW=0;
        }
      }
      if (mouseY>height*14/26 &&mouseY<height*15/26) {
        supe++;
        if (supe==3) {
          supe=0;
        }
      }
      if (mouseY>height*15/26 &&mouseY<height*16/26) {
        answ++;
        if (answ==3) {
          answ=0;
        }
      }
      if (mouseY>height*17/26 &&mouseY<height*18/26) {
        audi++;
        if (audi==3) {
          audi=0;
        }
      }
      if (mouseY>height*18/26 &&mouseY<height*19/26) {
        fitn++;
        if (fitn==3) {
          fitn=0;
        }
      }
      if (mouseY>height*19/26 &&mouseY<height*20/26) {
        mmc++;
        if (mmc==3) {
          mmc=0;
        }
      }
      if (mouseY>height*20/26 &&mouseY<height*21/26) {
        newR++;
        if (newR==3) {
          newR=0;
        }
      }
      if (mouseY>height*21/26 &&mouseY<height*22/26) {
        seni++;
        if (seni==3) {
          seni=0;
        }
      }
      if (mouseY>height*22/26 &&mouseY<height*23/26) {
        vallR++;
        if (vallR==3) {
          vallR=0;
        }
      }
      if (mouseY>height*23/26 &&mouseY<height*24/26) {
        pint++;
        if (pint==3) {
          pint=0;
        }
      }
      if (mouseY>height*24/26 &&mouseY<height*25/26) {
        pant++;
        if (pant==3) {
          pant=0;
        }
      }
      if (mouseY>height*25/26 &&mouseY<height*26/26) {
        fres++;
        if (fres==3) {
          fres=0;
        }
      }
    }
  }
}

