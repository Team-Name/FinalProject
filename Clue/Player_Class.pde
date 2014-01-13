class Player {
  PVector loc;
  boolean moving;
  int movesLeft;

  Player() {
    //loc =
    moving = false;
  }

  void display() {
  }

  void move() {
    if (!moving) {
      movesLeft = int(random(1, 7)) + int(random(1, 7));
      moving = true;
      display movesLeft;
    }
    else {
      display roll;
      if board (
    }
  }
  //methods: display, move, roll, suggest, accuse
  //variables: position
}

class ComputerPlayer extends Player {
  //same except make everything automatic and random, and a notesheet to determine suggestions and accusations 
  Notesheet note;
}

