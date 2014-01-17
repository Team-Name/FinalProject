int stage;
Start st;
boolean inst;
CardPile c;
Card[] murder;
Player() p;
ComputerPlayer[] cp;
int turn;

void setup() {
  //settings
  size(500, 500);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  st=new Start();
  inst = false; //do we need this?
  stage = 0;
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
    //screen to choose a teacher
    //give the name and sprite to the player p (initialize p)
    //increase stage and start game (figure out murder cards, distribute cards, etc)
  }
  else if (stage == 2) { //actual game
    
  }
  else {
  }
}

void mousePressed() {
  if (stage == 0) {
    st.changeStage(); 
    st.rules();
  }
}

void startGame() { //things that can be done after player chooses teacher
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
}

