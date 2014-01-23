class Board {
  ArrayList<PVector> notLeft;
  
  Board() {
    makeNots();
  }
    
  //dir will have one of the following values UP, RIGHT, LEFT, or DOWN (I'm just using the keycodes)
  boolean canMove(PVector loc, int dir) {
    //can the player move
    //some way to determine the secret passage route
  }
  
  String inRoom(PVector loc) {
    //is the player in a room?
    //if yes return string of room
    //Auditorium, Fitness Center, MMC, New Room, Senior Lounge, Mrs. Valley's Room, Mrs. Pinto's Room, Mr. Pantaleo's Room, Freshman Tech Room, Office
    //if no return null
  }
  
  int directionTo(PVector loc, String room) {
    //return the direction to the room with shortest steps
  }
  
  String[] nearestRooms(PVector loc) {
    //returns list of the rooms in order of closest to farthest
  }
  
  int stepsTo(PVector loc, String room) {
    //returns the number of steps to the room
  }
  
  PVector gridToCode(PVector loc) {
    //given grid location return location on screen
  }
  
  void makeNots() {
    notLeft = new ArrayList<PVector>();
    notLeft.add(new PVector(0, 5));
    notLeft.add(new PVector(0, 18));
    notLeft.add(new PVector(1, 4));
    notLeft.add(new PVector(1, 11));
    notLeft.add(new PVector(1, 17));
    notLeft.add(new PVector(6, 6));
    notLeft.add(new PVector(6, 10));
    notLeft.add(new PVector(6, 12));
    notLeft.add(new PVector(6, 13));
    notLeft.add(new PVector(6, 14));
    notLeft.add(new PVector(6, 16));
    notLeft.add(new PVector(6, 20));
    notLeft.add(new PVector(6, 21));
    notLeft.add(new PVector(6, 22));
    notLeft.add(new PVector(7, 23));
    notLeft.add(new PVector(7, 7));
    notLeft.add(new PVector(7, 0));
    notLeft.add(new PVector(7, 9));
    notLeft.add(new PVector(7, 1));
    notLeft.add(new PVector(7, 2));
    notLeft.add(new PVector(7, 3));
    notLeft.add(new PVector(9, 24));
    notLeft.add(new PVector(14, 24));
    notLeft.add(new PVector(14, 8));
    notLeft.add(new PVector(14, 9));
    notLeft.add(new PVector(14, 10));
    notLeft.add(new PVector(14, 11));
    notLeft.add(new PVector(14, 12));
    notLeft.add(new PVector(14, 13));
    notLeft.add(new PVector(14, 14));
    notLeft.add(new PVector(15, 1));
    notLeft.add(new PVector(15, 2));
    notLeft.add(new PVector(15, 3));
    notLeft.add(new PVector(15, 4));
    notLeft.add(new PVector(15, 5));
    notLeft.add(new PVector(16, 0));
    notLeft.add(new PVector(16, 17));
    notLeft.add(new PVector(16, 18));
    notLeft.add(new PVector(16, 19));
    notLeft.add(new PVector(16, 20));
    notLeft.add(new PVector(16, 21));
    notLeft.add(new PVector(16, 22));
    notRight = new ArrayList<PVector>();
    notRight.add(new PVector(7, 0));
    notRight.add(new PVector(7, 17));
    notRight.add(new PVector(7, 18));
    notRight.add(new PVector(7, 19));
    notRight.add(new PVector(7, 20));
    notRight.add(new PVector(7, 21));
    notRight.add(new PVector(7, 22));
    notRight.add(new PVector(8, 1));
    notRight.add(new PVector(8, 2));
    notRight.add(new PVector(8, 3));
    notRight.add(new PVector(8, 4));
    notRight.add(new PVector(8, 5));
    notRight.add(new PVector(8, 6));
    notRight.add(new PVector(8, 8));
    notRight.add(new PVector(8, 9));
    notRight.add(new PVector(8, 10));
    notRight.add(new PVector(8, 12));
    notRight.add(new PVector(8, 13));
    notRight.add(new PVector(8, 14));
    notRight.add(new PVector(9, 23));
    notRight.add(new PVector(9, 24));
    notRight.add(new PVector(15, 9));
    notRight.add(new PVector(15, 10));
    notRight.add(new PVector(15, 11));
    notRight.add(new PVector(15, 12));
    notRight.add(new PVector(15, 13));
    notRight.add(new PVector(15, 14));
    notRight.add(new PVector(15, 15));
    notRight.add(new PVector(16, 0));
    notRight.add(new PVector(16, 1));
    notRight.add(new PVector(16, 2));
    notRight.add(new PVector(16, 3));  
    notRight.add(new PVector(16, 4));
    notRight.add(new PVector(16, 5));
    notRight.add(new PVector(, ));
    notRight.add(new PVector(, ));
    notRight.add(new PVector(, ));
    notRight.add(new PVector(, ));
    notRight.add(new PVector(, ));
    notRight.add(new PVector(, ));
    notRight.add(new PVector(, ));
    notRight.add(new PVector(, ));
}
  
  //GET RID OF DOORS
  
}
