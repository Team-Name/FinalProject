class Board {
  ArrayList<PVector> notLeft;
  ArrayList<PVector> notRight;
  ArrayList<PVector> notDown;
  ArrayList<PVector> notUp;
  String[] rooms;
  PVector[] roomLocs;

  Board() {
    makeNots();
    setUpRooms();
  }

  //returns if player can move at loc in the direction dir
  boolean canMove(PVector loc, int dir) {
    if (dir == LEFT) {
      for (PVector p : notLeft) {
        if (loc.equals(p)) {
          return false;
        }
      }
    }
    else if (dir == RIGHT) {
      for (PVector p : notRight) {
        if (loc.equals(p)) {
          return false;
        }
      }
    }
    else if (dir == UP) {
      for (PVector p : notUp) {
        if (loc.equals(p)) {
          return false;
        }
      }
    }
    else {
      for (PVector p : notDown) {
        if (loc.equals(p)) {
          return false;
        }
      }
    }
    return true;
  }

  //returns String room if player is in a room otherwise null
  String inRoom(PVector loc) {
    for (int i = 0; i < rooms.length; i++) {
      if (roomLocs[i].equals(loc)) {
        return rooms[i];
      }
    }
    return null;
  }

  //return the direction to the room
  int directionTo(PVector loc, String room) {
    PVector roomLoc = new PVector();
    for (int i = 0; i < rooms.length; i++) {
      if (rooms[i].equals(room)) {
        roomLoc = roomLocs[i];
      }
    }
    PVector dirVector = new PVector(roomLoc.x-loc.x, roomLoc.y-loc.y);
    if (abs(dirVector.x) > abs(dirVector.y)) {
      if (dirVector.x > 0) {
        return RIGHT;
      }
      else {
        return LEFT;
      }
    }
    else {
      if (dirVector.y > 0) {
        return DOWN;
      }
      else {
        return UP;
      }
    }
  }

  //returns an array of the nearest rooms
  String[] nearestRooms(PVector loc) {
    String[] nearest = new String[9];
    ArrayList<String> allRooms = new ArrayList<String>();
    ArrayList<Float> allDists = new ArrayList<Float>();
    for (int i = 0; i < rooms.length; i++) {
      allRooms.add(rooms[i]);
      allDists.add(loc.dist(roomLocs[i]));
    }
    int next = 0;
    while (allRooms.size() != 1) {
      int smallestIndex = 0;
      for (int i = 1; i < allDists.size(); i++) {
        if (allDists.get(i) < allDists.get(smallestIndex)) {
          smallestIndex = i;
        }
      }
      nearest[next] = allRooms.get(smallestIndex);
      allRooms.remove(smallestIndex);
      allDists.remove(smallestIndex);
      next++;
    }
    return nearest;
  }

  //converts a grid location to an actual location
  PVector gridToCode(PVector loc) {
    return new PVector(loc.x*24.9+42, loc.y*24+33);
  }

  //sets up the rooms
  void setUpRooms() {
    rooms = new String[10];
    roomLocs = new PVector[10];
    rooms[0] = "Mrs. Pinto's Room";
    rooms[1] = "Fitness Center";
    rooms[2] = "Freshman Tech Room";
    rooms[3] = "Senior Lounge";
    rooms[4] = "New Room";
    rooms[5] = "MMC";
    rooms[6] = "Mr. Pantaleo's Room";
    rooms[7] = "Auditorium";
    rooms[8] = "Mrs. Valley's Room";
    rooms[9] = "Office";
    roomLocs[0] = new PVector(6, 3);
    roomLocs[1] = new PVector(12, 6);
    roomLocs[2] = new PVector(17, 5);
    roomLocs[3] = new PVector(6, 8);
    roomLocs[4] = new PVector(5, 15);
    roomLocs[5] = new PVector(17, 9);
    roomLocs[6] = new PVector(4, 19);
    roomLocs[7] = new PVector(14, 17);
    roomLocs[8] = new PVector(19, 18);
    roomLocs[9] = new PVector(9, 11);
  }
  
  //locations and directions where one cannot move
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

    notLeft.add(new PVector(6, 3));
    notLeft.add(new PVector(12, 6));
    notLeft.add(new PVector(17, 5));
    notLeft.add(new PVector(6, 8));
    notLeft.add(new PVector(5, 15));
    notLeft.add(new PVector(17, 9));
    notLeft.add(new PVector(4, 19));
    notLeft.add(new PVector(14, 17));
    notLeft.add(new PVector(19, 18));
    notLeft.add(new PVector(9, 11));

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
    notRight.add(new PVector(16, 23));
    notRight.add(new PVector(17, 18));
    notRight.add(new PVector(17, 19));
    notRight.add(new PVector(17, 20));
    notRight.add(new PVector(17, 21));
    notRight.add(new PVector(17, 22));
    notRight.add(new PVector(22, 6));
    notRight.add(new PVector(22, 8));
    notRight.add(new PVector(22, 16));
    notRight.add(new PVector(23, 7));
    notRight.add(new PVector(23, 17));
    notRight.add(new PVector(14, 24));

    notRight.add(new PVector(6, 3));
    notRight.add(new PVector(12, 6));
    notRight.add(new PVector(17, 5));
    notRight.add(new PVector(17, 9));
    notRight.add(new PVector(14, 17));
    notRight.add(new PVector(19, 18));
    notRight.add(new PVector(9, 11));

    notDown = new ArrayList<PVector>();
    notDown.add(new PVector(0, 5));
    notDown.add(new PVector(1, 5));
    notDown.add(new PVector(2, 5));
    notDown.add(new PVector(3, 5));
    notDown.add(new PVector(4, 5));
    notDown.add(new PVector(5, 5));
    notDown.add(new PVector(6, 6));
    notDown.add(new PVector(9, 7));
    notDown.add(new PVector(10, 7));
    notDown.add(new PVector(11, 7));
    notDown.add(new PVector(12, 7));
    notDown.add(new PVector(13, 7));
    notDown.add(new PVector(23, 7));
    notDown.add(new PVector(16, 8));
    notDown.add(new PVector(18, 8));
    notDown.add(new PVector(19, 8));
    notDown.add(new PVector(20, 8));
    notDown.add(new PVector(21, 8));
    notDown.add(new PVector(22, 8));
    notDown.add(new PVector(1, 11));
    notDown.add(new PVector(2, 11));
    notDown.add(new PVector(3, 11));
    notDown.add(new PVector(4, 11));
    notDown.add(new PVector(5, 11));
    notDown.add(new PVector(8, 16));
    notDown.add(new PVector(9, 16));
    notDown.add(new PVector(10, 16));
    notDown.add(new PVector(11, 16));
    notDown.add(new PVector(12, 16));
    notDown.add(new PVector(13, 16));
    notDown.add(new PVector(15, 16));
    notDown.add(new PVector(18, 17));
    notDown.add(new PVector(20, 17));
    notDown.add(new PVector(21, 17));
    notDown.add(new PVector(22, 17));
    notDown.add(new PVector(23, 17));
    notDown.add(new PVector(24, 17));
    notDown.add(new PVector(0, 18));
    notDown.add(new PVector(1, 18));
    notDown.add(new PVector(2, 18));
    notDown.add(new PVector(3, 18));
    notDown.add(new PVector(4, 18));
    notDown.add(new PVector(6, 22));
    notDown.add(new PVector(17, 22));
    notDown.add(new PVector(7, 23));
    notDown.add(new PVector(8, 23));
    notDown.add(new PVector(15, 23));
    notDown.add(new PVector(16, 23));
    notDown.add(new PVector(9, 24));
    notDown.add(new PVector(14, 24));
    notDown.add(new PVector(5, 19));

    notDown.add(new PVector(6, 8));
    notDown.add(new PVector(5, 15));
    notDown.add(new PVector(17, 9));
    notDown.add(new PVector(4, 19));
    notDown.add(new PVector(14, 17));
    notDown.add(new PVector(19, 18));
    notDown.add(new PVector(9, 11));

    notUp = new ArrayList<PVector>();
    notUp.add(new PVector(7, 0));
    notUp.add(new PVector(16, 0));
    notUp.add(new PVector(8, 1));
    notUp.add(new PVector(15, 1));
    notUp.add(new PVector(1, 4));
    notUp.add(new PVector(2, 4));
    notUp.add(new PVector(3, 4));
    notUp.add(new PVector(4, 4));
    notUp.add(new PVector(5, 4));
    notUp.add(new PVector(18, 6));
    notUp.add(new PVector(19, 6));
    notUp.add(new PVector(20, 6));
    notUp.add(new PVector(21, 6));
    notUp.add(new PVector(22, 6));
    notUp.add(new PVector(9, 7));
    notUp.add(new PVector(10, 7));
    notUp.add(new PVector(11, 7));
    notUp.add(new PVector(13, 7));
    notUp.add(new PVector(14, 7));
    notUp.add(new PVector(23, 7));
    notUp.add(new PVector(6, 10));
    notUp.add(new PVector(1, 11));
    notUp.add(new PVector(2, 11));
    notUp.add(new PVector(3, 11));
    notUp.add(new PVector(4, 11));
    notUp.add(new PVector(5, 11));
    notUp.add(new PVector(9, 15));
    notUp.add(new PVector(10, 15));
    notUp.add(new PVector(11, 15));
    notUp.add(new PVector(12, 15));
    notUp.add(new PVector(13, 15));
    notUp.add(new PVector(16, 16));
    notUp.add(new PVector(17, 16));
    notUp.add(new PVector(18, 16));
    notUp.add(new PVector(19, 16));
    notUp.add(new PVector(20, 16));
    notUp.add(new PVector(21, 16));
    notUp.add(new PVector(22, 16));
    notUp.add(new PVector(1, 17));
    notUp.add(new PVector(2, 17));
    notUp.add(new PVector(3, 17));
    notUp.add(new PVector(4, 17));
    notUp.add(new PVector(5, 17));
    notUp.add(new PVector(23, 17));
    notUp.add(new PVector(0, 18));
    notUp.add(new PVector(8, 23));
    notUp.add(new PVector(9, 23));
    notUp.add(new PVector(14, 23));
    notUp.add(new PVector(15, 23));
    notUp.add(new PVector(0, 5));

    notUp.add(new PVector(6, 3));
    notUp.add(new PVector(12, 6));
    notUp.add(new PVector(17, 5));
    notUp.add(new PVector(6, 8));
    notUp.add(new PVector(5, 15));
    notUp.add(new PVector(4, 19));
  }
}

