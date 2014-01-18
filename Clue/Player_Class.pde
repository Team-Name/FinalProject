class Player {
  PVector loc;
  int movesLeft;
  String lastRoom;
  PImage picture;
  Card[] cards;

  void reset(PVector startLoc, myCards, myPicture) {
    loc = startLoc;
    movesLeft = 0;
    cards = myCards;
    picture = myPicture;
    moveEnd = true;
  }

  void display() {
    //display picture at loc
  }

  //0 = up, 1 = right, 2 = down, 3 = left
  //also if room is same one started in
  void move() {
    if (b.inRoom(loc).equals("Office")) {
      //display screen to make accusation
      //if accusation is right, change won boolean and stage variable
      //if accusation is wrong, change stage variable
    }
    else if (movesLeft == 0) {
      movesLeft = int(random(1, 7)) + int(random(1, 7));
    }
    else () {
      //player moves (roll die, move sprite in direction until movesLeft is less than 0 or player is in a room)
      //display movesLeft
      if (keyPressed && keyCode >= 37 && keyCode <= 40) { //if this isn't working have to make it keyReleased
        direction = keyCode;
        if (board.canMove(direction)) {
          //change loc
          movesLeft--;
        }
      }
      if (b.inRoom(loc) != null && !b.inRoom(loc).equals(lastRoom)) {
        //display screen to make suggestion and store the three cards that made the suggestion in Cards[3] suggestion, might need another boolean to do this
        ArrayList<Card> revealed = reveal(suggestion);
        //display cards in revealed for a certain amount of dictated by a timer
        turn = false;
      }
      if (movesLeft == 0) {
        turn = false;
      }
    }
  }

  ArrayList<Card> reveal(Cards[] suggestion) {
    ArrayList<Card> match = new ArrayList<Card>();
    for (ComputerPlayer cplayer : cplayers) {
      if (cplayer.checkCards(suggesion) != null) {
        match.add(cplayer.checkCards(suggesion));
      }
    }
    return match;
  }

  Card checkCards(Card[] suggestion) {
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

  void reset(starting spot, myCards, int myIndex) {
    super.reset(spot, myCards);
    index = myIndex;
  }

  //FIX THIS
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
        movesLeft--;
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

