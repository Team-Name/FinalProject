class Board {
  //maybe an array for possible locations in board would help? so maybe like a 2x2 array with x's for spaces can't go and numbers for certain rooms? 
  
  Board() {
    
  }
    
  //dir will have one of the following values UP, RIGHT, LEFT, or DOWN (I'm just using the keycodes)
  boolean canMove(PVector loc, int dir) {
    //can the player move
    //some way to determine the secret passage route
  }
  
  String inRoom(PVector loc, int dir) {
    //is the player in a room?
    //if yes return string of room
    //Auditorium, Fitness Center, MMC, New Room, Senior Lounge, Mrs. Valley's Room, Mrs. Pinto's Room, Mr. Pantaleo's Room, Freshman Tech Room, Office
    //if no return null
  }
  
  int directionTo(PVector loc, int dir, String room) {
    //return the direction to the room with shortest steps
  }
  
  String[] nearestRooms(PVector loc, int dir) {
    //returns list of the rooms in order of closest to farthest
  }
  
  int stepsTo(PVector loc, int dir, String room) {
    //returns the number of steps to the room
  }
  
}
