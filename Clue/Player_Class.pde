class Player {
  PVector loc;
  int movesLeft;
  String lastRoom;
  PImage picture;
  Card[] cards;
  String teacher;
  Card[] suggestion;
  Card[] accusation;

  Player(PVector startLoc, Card[] myCards, String myTeacher) {
    loc = startLoc;
    movesLeft = 0;
    teacher = myTeacher;
    cards = myCards;
    //sets a picture for the player
    if (teacher.equals("Ms. Gerstein")) { 
      picture = gpic;
    }
    else if (teacher.equals("Mrs. Kipp")) { 
      picture = kpic;
    }
    else if (teacher.equals("Mrs. Monroy")) { 
      picture = monpic;
    }
    else if (teacher.equals("Mr. Moskowitz")) { 
      picture = mospic;
    }
    else if (teacher.equals("Mr. Sanservino")) { 
      picture = spic;
    }
    else { 
      picture = vpic;
    }
  }

  //displays the player token
  void display() {
    picture.resize(24, 24);
    image(picture, b.gridToCode(loc).x, b.gridToCode(loc).y);
  }

  //0 = up, 1 = right, 2 = down, 3 = left
  //moves the player
  void move() {
    //if in office, accuse
    if (b.inRoom(loc) != null && b.inRoom(loc).equals("Office")) {
      accusation = new Card[3]; 
      background(0);
      accusationScreen = true;
      accuseStage = 0;
    }
    //if starting the move, roll random number
    else if (movesLeft == 0) {
      movesLeft = int(random(1, 7)) + int(random(1, 7));
    }
    //if moving, check if in room and display movesleft
    else {
      textSize(80);
      textAlign(LEFT, UP);
      fill(255);
      text("Moves left: " + movesLeft, 10, 730);
      if (b.inRoom(loc) != null && !b.inRoom(loc).equals(lastRoom)) {
        lastRoom = b.inRoom(loc);
        suggestion = new Card[3];
        suggestion[0] = new Card(1, b.inRoom(loc));
        background(0);
        suggestionScreen = true;
        suggestStage = 0;
      }
    }
  }

  //checks if player has any of the cards in suggestion
  Card checkCards(Card[] suggestion) {
    Card[] suggestionRand = new Card[suggestion.length];
    arrayCopy(suggestion, suggestionRand);
    shuffleCards(suggestionRand);
    Card[] cardsRand = new Card[cards.length];
    arrayCopy(cards, cardsRand);
    shuffleCards(cardsRand);
    for (Card x : suggestionRand) {
      for (Card y : cardsRand) { 
        if (x.equal(y) == true) {
          return y;
        }
      }
    }
    return null;
  }

  //reveals one card or no cards to show for suggestion
  Card reveal(Card[] suggestion) {
    for (ComputerPlayer cplayer : cp) { 
      //order is counterclockwise so player 1 is left, player 2 is top, player 3 is right, human player is bottom
      Card match = cplayer.checkCards(suggestion); 
      if (match != null) {
        return match;
      }
    }
    return null;
  }

  //checks if accusation is right
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

  //shuffles the card order
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
  ArrayList<Card> possibleSuspects;
  ArrayList<Card> possibleRooms;
  ArrayList<Card> possibleWeapons;
  int index; 

  ComputerPlayer(PVector startLoc, Card[] myCards, String myTeacher, int myIndex) {
    super(startLoc, myCards, myTeacher);
    index = myIndex;
    possibleSuspects = c.setUpTeachers();
    possibleRooms = c.setUpRooms();
    possibleWeapons = c.setUpWeapons();
    for (Card card : myCards) {
      sawCard(card);
    }
  }

  //moves the computer player
  void move () {
    //if in accusation room, computer won
    if (b.inRoom(loc) != null && b.inRoom(loc).equals("Office")) {
      stage++;
    }
    //moves according to what cards it has, and if it gets stuck, it moves differently
    else {
      movesLeft = int(random(1, 7)) + int(random(1, 7));
      int stuck = 0;
      while (movesLeft > 0) {
        int direction = getDirection();
        if (b.canMove(loc, direction)) {
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
          stuck = 0;
        }
        else {
          stuck++;
        }
        if (stuck >= 3) {
          if (direction == LEFT) {
            loc.y++;
          }
          else if (direction == RIGHT) {
            loc.y--;
          }
          else if (direction == UP) {
            loc.x++;
          }
          else {
            loc.x--;
          }
          stuck = 0;
        }
        if (stuck >= 5) {
          if (direction == LEFT) {
            loc.y--;
          }
          else if (direction == RIGHT) {
            loc.y++;
          }
          else if (direction == UP) {
            loc.x--;
          }
          else {
            loc.x++;
          }
          stuck = 0;
        }
        if (b.inRoom(loc) != null && !b.inRoom(loc).equals(lastRoom)) {
          Card[] suggestion = getSuggestion();
          suggestion[1] = b.inRoom(loc);
          sawCard(reveal(suggestion)); 
          movesLeft = 0;
        }
      }
    }
  }

  //different reveal function because the order is counterclockwise
  Card reveal(Card[] suggestion) {
    Card match;
    for (int i = index+1; i<3; i++) {
      match = cp[i].checkCards(suggestion);
      if (match != null) {
        return match;
      }
    }
    match = p.checkCards(suggestion);
    if (match != null) {
      return match;
    }
    for (int i = 0; i<index; i++) {
      match = cp[i].checkCards(suggestion);
      if (match != null) {
        return match;
      }
    }
    return null;
  }

  //returns direction for player to move in
  int getDirection() {
    String[] pRooms = b.nearestRooms(loc);
    if (accuse()) {
      return b.directionTo(loc, "Office");
    }
    else if (possibleRooms.size() == 1) {
      if (!pRooms[0].equals(lastRoom)) {
        return b.directionTo(loc, pRooms[0]);
      }
      return b.directionTo(loc, pRooms[1]);
    }
    else {
      for (String r : pRooms) {
        for (Card c : possibleRooms) {
          if (r.equals(c.detail)) {
            return b.directionTo(loc, r);
          }
        }
      }
    }
    return 0;
  }

  //returns the computer's suggestion randomly from things it doesn't know
  Card[] getSuggestion() {
    Card[] s = new Card[3];
    s[0] = possibleSuspects.get(int(random(possibleSuspects.size())));
    s[1] = possibleRooms.get(int(random(possibleRooms.size())));
    s[2] = possibleWeapons.get(int(random(possibleWeapons.size())));
    return s;
  }

  //returns if computer can accuse
  boolean accuse() {
    if (possibleSuspects.size() == 1 && possibleRooms.size() == 1 && possibleWeapons.size() == 1) {
      return true;
    }
    return false;
  }

  //gets the player's accusation
  Card[] getAccusation() {
    Card[] a = {
      possibleSuspects.get(0), possibleRooms.get(0), possibleWeapons.get(0)
      };
      return a;
  }

  //adds card to cards seen by computer
  void sawCard(Card saw) {
    if (saw.type == 0) {
      for (int i = 0; i < possibleSuspects.size(); i++) {
        if (possibleSuspects.get(i).equal(saw)) {
          possibleSuspects.remove(i);
        }
      }
    }
    else if (saw.type == 1) {
      for (int i = 0; i < possibleRooms.size(); i++) {
        if (possibleRooms.get(i).equal(saw)) {
          possibleRooms.remove(i);
        }
      }
    }
    else {
      for (int i = 0; i < possibleWeapons.size(); i++) {
        if (possibleWeapons.get(i).equal(saw)) {
          possibleWeapons.remove(i);
        }
      }
    }
  }
}

