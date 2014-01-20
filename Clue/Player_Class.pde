class Player {
  PVector loc;
  int movesLeft;
  String lastRoom;
  PImage picture;
  Card[] cards;
  boolean turn;

  void reset(PVector startLoc, Card[] myCards, PImage myPicture) {
    loc = startLoc;
    movesLeft = 0;
    picture = myPicture;
    cards = myCards;
    turn = false;
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
        int direction = keyCode;
        if (board.canMove(direction)) {
          //change loc
          movesLeft--;
        }
      }
      if (b.inRoom(loc) != null && !b.inRoom(loc).equals(lastRoom)) {
        //display screen to make suggestion and store the three cards that made the suggestion in Cards[3] suggestion, might need another boolean to do this
        Card revealed = reveal(suggestion);
        //display card for a certain amount as dictated by a timer (and who revealed it)
        turn = false;
      }
      if (movesLeft == 0) {
        turn = false;
      }
    }
  }

  Card reveal(Cards[] suggestion) {
    for (ComputerPlayer cplayer : cp) { //so player 1 is left, player 2, is top, player 3 is right
      if (cplayer.checkCards(suggesion) != null) {
        return match;
      }
    }
    return null;
  }

  Card checkCards(Card[] suggestion) {
    for (Card x : suggestion) {
      for (Card y : cards) { //randomize order of cards checked
        if (x.checkEqual(y) == true) {
          return y;
        }
      }
    }
    return null;
  }
}

class ComputerPlayer extends Player {
  //array brain to keep track of what things are crossed off
  int index; 

  void reset(PVector startLoc, Card[] myCards, PImage myPicture, int myIndex) {
    super.reset(startLoc, myCards, myPicture);
    for (Card card : myCards) {
      sawCard(card);
    } 
    index = myIndex;
  }

  void move () {
    if (b.inRoom(loc).equals("Office")) {
      //change stage variable
    }
    else if (movesLeft == 0) {
      movesLeft = int(random(1, 7)) + int(random(1, 7));
    }
    else () {
      //slow this down so player see what happens and how computer moves
      int direction = getDirection();
      if (board.canMove(direction)) {
        //change loc
        movesLeft--;
      }
      if (b.inRoom(loc) != null && !b.inRoom(loc).equals(lastRoom)) {
        Card[] suggestion = getSuggestion;
        //stop here for a few seconds, reveal suggestion
        sawCard(reveal(suggestion)); 
        turn = false;
      }
      if (movesLeft == 0) {
        turn = false;
      }
    }
  }

  Card reveal(Cards[] suggestion) {
    Card match;
    for (int i = index+1; i++; i<3) {
      match = cplayer.checkCards(suggesion);
      if (match != null) { //need super here?
        //display message saying that computer player showed computer player a card
        return match;
      }
    }
    match = cplayer.checkCards(suggesion);
    if (match != null) {
      //display message saying that player showed computer player match
      return match;
    }
    for (int i = 0; i++; i<index) {
      match = cplayer.checkCards(suggesion);
      if (cplayer.checkCards(suggesion) != null) {
        //display message saying that computer player showed computer player a card
        return match;
      }
    }
    return null;
  }


  Card[] getSuggestion() {
    //use brain to get a weapon and person not known
    //somehow display to player what computer's suggestion is
  }

  boolean accuse() {
    //return if cplayer knows enough to accuse
  }

  Card[] getAccusation() {
    //get the accusation
  }

  int getDirection() {
    //return the direction to the nearest room the player hasn't been in, or if have been in all the closest room that wasn't the last room, or the office if can accuse
  }

  void sawCard(Card saw) {
    //add saw to brain
  }
}

//brain determines where to move too

