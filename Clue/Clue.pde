import ddf.minim.*;
Minim minim;
AudioPlayer music;
int stage;
Start st;
boolean inst, turn, won;
CardPile c;
Card[] murder;
Board b;
Player p;
ComputerPlayer[] cp;
int turn;
int gers, sans, kipp, mosk, monr, vall=0;
int id, whir, deaf, blin, expl, nullW, supe, answ=0;
int audi, fitn, mmc, newR, seni, vallR, pint, pant, fres=0;
PFont font;

void setup() {
  //settings
  size(500, 500);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  minim = new Minim(this);
  music = minim.loadFile("battlemusic.mp3");
  music.play();
  music.loop();
  font=loadFont("AmericanTypewriter-20.vlw");
  textFont(font);
  st = new Start();
  inst = false;
  stage = 0;
  won = false;
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
  else if (stage == 1) { //choosing a teacher to play with
    String teacher;
    //display screen to choose character

      if (/*chose character*/) {
      c = new CardPile();
      murder = new Card[3];
      murder = c.getMurder;
      Card[5][4] playerCards = new Card[5][4];
      int i = 0;
      int j = 0;
      Card nextCard = c.getRandomCard();
      while (nextCard != null) {
        playerCards[i][j] = nextCard;
        j++;
        if (j == 4) {
          j = 0;
          i++;
        }
      }
      //initialize variables (give players characters)
      //random choose three of the remaining teachers and assign players
      //give players cards
      //pick starting location for each player (person starts at bottom, player 1 is left, player 2, is top, player 3 is right)
      p = new Player(); 
      cp = new ComputerPlayer[3];
      for (ComputerPlayer i : cp) {
        i = new ComputerPlayer();
      }

      stage++;
    }
  }
  else if (stage == 2) { //actual game
    //display the picture of the board and sidebar and teacher pieces on board
    notesheet()
      if (turn) {
        p.move();
      }
    //computer players move (need a timer otherwise this would be too fast)
      else {
        for (ComputerPlayer i : cp) {
          i.move();
        }
      }
  }
  else { //end game
    //also display correct murder cards and the winner (if someone accused right)
  }
}

void mousePressed() {
  if (stage == 0) {
    st.changeStage(); 
    st.rules();
  }
}

//to put somewhere
//pictures for sprites

//to implement later: restart, music

