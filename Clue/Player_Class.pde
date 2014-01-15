class Player {
  PVector loc;
  int movesLeft;
  Card[] cards;

  Player(starting spot, myCards) {
    loc = starting spot;
    movesLeft = 0;
    cards = myCards;
  }

  void display() {
    display sprite at loc;
  }

  //0 = up, 1 = right, 2 = down, 3 = left
  void move(int _direction) {
    if (movesLeft == 0) {
      movesLeft = int(random(1, 7)) + int(random(1, 7));
      moving = true;
      display movesLeft;
    }
    else {
      display roll;
      if (board.canMove(direction)) {
        change loc;
        moveLeft--;
      }
    }
  }

  ArrayList<Card> suggest(Cards[3] suggestion) {
    ArrayList<Card> reveal = new ArrayList<Card>();
    Card c;
    for (ComputerPlayer cplayer : cplayers) {
      c = cplayer.checkCards(suggesion);
      if (c != null) {
        reveal.add(c);
      }
    }
    return reveal;
  }

  Card checkCards(Card[3] suggestion) {
    for (Card x : suggestion) {
      for (Card y : cards) {
        if (x.checkEqual(y) == true) {
          return y;
        }
      }
    }
    return null;
  }
}

class ComputerPlayer extends Player {
  CPUBrain brain;
  int index = num in array; 
  
  ComputerPlayer(starting spot, myCards, int myIndex) {
    super(spot, myCards);
    index = myIndex;
  }
  
  //WORK ON THIS
  void move (int _direction) {
    if (movesLeft == 0) {
      movesLeft = int(random(1, 7)) + int(random(1, 7));
      moving = true;
      display movesLeft;
    }
    else {
      display roll;
      direction given by cpubrain;
      if (board.canMove(direction)) {
        change loc;
        moveLeft--;
      }
    }
    //check cards with player
    
    //check cards with other computers
    for (ComputerPlayer cplayer : cplayers) {
      c = cplayer.checkCards(suggesion);
      if (c != null) {
        reveal.add(c);
      }
    }
    return reveal;
  }
  
  
}

//brain determines where to move too
