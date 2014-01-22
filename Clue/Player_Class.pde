class Player {
  PVector loc;
  int movesLeft;
  String lastRoom;
  PImage picture;
  Card[] cards;
  boolean turn;

  Player(PVector startLoc, Card[] myCards, PImage myPicture) {
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
  void move() {
    if (b.inRoom(loc).equals("Office")) {
      Card[] accusation; 
      //display screen to make accusation
      if (accusation != null) {
        stage++;
        if (checkAccusation(accusation)) {
          won = true;
        }
      }
    }
    else if (movesLeft == 0) {
      movesLeft = int(random(1, 7)) + int(random(1, 7));
    }
    else () {
      //display movesLeft
      if (keyPressed && keyCode >= 37 && keyCode <= 40) { //if this isn't working have to make it keyReleased
        int direction = keyCode;
        if (board.canMove(direction)) {
          if (direction == LEFT) {
            loc.x--;
          }
          else if (direction == RIGHT) {
            loc.x++;
          }
          else if (direction == UP) {
            loc.y--;
          }
          else {
            loc.y++;
          }
          movesLeft--;
        }
      }
      if (b.inRoom(loc) != null && !b.inRoom(loc).equals(lastRoom)) {
        lastRoom = b.inRoom(loc);
        Card[] suggestion;
        if (suggestion != null) {
          Card revealed = reveal(suggestion);
          //display card for a certain amount as dictated by a timer (and who revealed it)
          movesLeft = 0;
          turn = false;
        }
      }
      if (movesLeft == 0) {
        turn = false;
      }
    }
  }

  Card reveal(Cards[] suggestion) {
    for (ComputerPlayer cplayer : cp) { //so player 1 is left, player 2 is top, player 3 is right, human player is bottom
      if (cplayer.checkCards(suggesion) != null) {
        return match;
      }
    }
    return null;
  }

  Card checkCards(Card[] suggestion) {
    Card[] suggestionRand = new Card[suggestion.length];
    arrayCopy(suggestion, suggestionRand);
    shuffleCards(suggestionRand);
    Card[] cardsRand = new Card[cards.length];
    arrayCopy(cards, cardsRand);
    shuffleCards(cardsRand);
    for (Card x : suggestionRand) {
      for (Card y : cardsRand) { 
        if (x.checkEqual(y) == true) {
          return y;
        }
      }
    }
    return null;
  }

  boolean checkAccusation(Card[] accusation) {
    int num = 0; 
    for (Card c : accusation) {
      for (Card d : murder) {
        if (c.equal(d)) {
          num++;
        }
      }
    }
    if (num == 3) {
      return true;
    }
    return false;
  }

  void shuffleCards(Card[] cards) {
    for (int i = cards.length - 1; i > 0; i--) {
      int index = int(random(i + 1));
      Card a = cards[index];
      cards[index] = cards[i];
      cards[i] = a;
    }
  }
}

class ComputerPlayer extends Player {
  Card[] possibleCards;
  int index; 

  ComputerPlayer(PVector startLoc, Card[] myCards, PImage myPicture, int myIndex) {
    super(startLoc, myCards, myPicture);
    index = myIndex;
    setUpCardArray(Card[] possibleCards);
    for (Card card : myCards) {
      sawCard(card);
    }
  }

  void move () {
    if (b.inRoom(loc).equals("Office")) {
      stage++;
    }
    else if (movesLeft == 0) {
      movesLeft = int(random(1, 7)) + int(random(1, 7));
    }
    else () {
      //slow this down so player see what happens and how computer moves
      int direction = getDirection();
      if (board.canMove(direction)) {
        if (direction == LEFT) {
          loc.x--;
        }
        else if (direction == RIGHT) {
          loc.x++;
        }
        else if (direction == UP) {
          loc.y--;
        }
        else {
          loc.y++;
        }
        movesLeft--;
      }
      if (b.inRoom(loc) != null && !b.inRoom(loc).equals(lastRoom)) {
        Card[] suggestion = getSuggestion;
        //stop here for a few seconds, show suggestion on screen
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
    for (int i = index+1; i<3; i++) {
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
    for (int i = 0; i<index; i++) {
      match = cplayer.checkCards(suggesion);
      if (cplayer.checkCards(suggesion) != null) {
        //display message saying that computer player showed computer player a card
        return match;
      }
    }
    return null;
  }

  int getDirection() {
    String[] rooms = nearestRooms(PVector loc, int dir);
    if (accuse()) {
      return b.directionTo(loc, "Office");
    }
    else if (possibleCards[1].size() == 1) {
      if (!rooms[0].equals(lastRoom)) {
        return b.directionTo(loc, rooms[0]);
      }
      return b.directionTo(loc, rooms[1]);
    }
    else {
      for (String r : rooms) {
        for (Card c : possibleCards[1]) {
          if (r.equals(c.detail) {
            return b.directionTo(loc, r);
          }
        }
      }
    }
  }

  Card[] getSuggestion() {
    Card[] s = new Card[3];
    s[0] = possibleCards[0].get(int(random(possibleCards[0].size())));
    s[1] = possibleCards[1].get(int(random(possibleCards[1].size())));
    s[2] = possibleCards[2].get(int(random(possibleCards[2].size())));
    return s;
  }

  boolean accuse() {
    if (possibleCards[0].size() == 1 && possibleCards[1].size() == 1 && possibleCards[2].size() == 1) {
      return true;
    }
    return false;
  }

  Card[] getAccusation() {
    Card[] a = {
      possibleCards[0].get(0), possibleCards[1].get(0), possibleCards[2].get(0)
    };
    return a;
  }

  void sawCard(Card saw) {
    for (int i = 0; i < possibleCards[saw.type].size(); i++) {
      if (possibleCards[0].get(i).equal(saw)) {
        possibleCards[0].remove(i);
      }
    }
  }
}

