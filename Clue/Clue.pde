int stage;
Start st;
boolean inst, turn, won;
CardPile c;
Card[] murder;
Board b;
Player p;
ComputerPlayer[] cp;
int turn;

void setup() {
  //settings
  size(500, 500);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
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
    //display screen to choose character

    if (/*pick place to choose player*/) {
      //initialize variables (give players characters)
      //random choose three of the remaining teachers and assign players
      //assign murder cards
      //give players cards
      //pick starting location for each player (person starts at bottom, player 1 is left, player 2, is top, player 3 is right)
      murder = new Card[3];
      cp = new ComputerPlayer[3];
      for (ComputerPlayer i : cp) {
        i = new ComputerPlayer();
      }
      c = new CardPile();
      murder = c.getMurder;
      Card nextCard = c.getRandomCard();
      if (nextCard != null) {
        //give to computer player in turn order
      }
      stage++;
    }
  }
  else if (stage == 2) { //actual game
    //display the picture of the board and sidebar and teacher pieces on board
    //display notesheet and clicking in certain spots to put x's there

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
    //also display correcct murder cards and the winner (if someone accused right)
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





