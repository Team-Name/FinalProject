class Board {
  //maybe an array for possible locations in board would help? so maybe like a 2x2 array with x's for spaces can't go and numbers for certain rooms? 
  
  Board() {
    
  }
    
  //dir will have one of the following values UP, RIGHT, LEFT, or DOWN (I'm just using the keycodes)
  boolean canMove(PVector loc; int dir) {
    //can the player move
    //some way to determine the secret passage route
  }
  
  String inRoom(PVector loc; int dir) {
    //is the player in a room?
    //if yes return string of room
    //Auditorium, Fitness Center, MMC, New Room, Senior Lounge, Mrs. Valley's Room, Mrs. Pinto's Room, Mr. Pantaleo's Room, Freshman Tech Room, Office
    //if no return null
  }
  
  
}
