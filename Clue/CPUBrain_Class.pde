
  // methods: get-Accusation
  // variables: boolean (turn), clue cards, accusation strings

class CPUBrain {
  PVector loc, dim;
  int i, e, u;
    i = 6;
    e = 6;
    u = 6;
  boolean turnp1, turnp2, turnp3, turnp4;
  String partOne, partTwo, partThree;
    partOne = "I think that ";
    partTwo = "I think the weapon was ";
    partThree = "I think the murder was committed in ";
  String[] accuseMurder = new String[i];
    accuseMurder[0] = partOne + "Ms. Gerstein is the murderer!";
    accuseMurder[1] = partOne + "Mr. Sanservino is the murderer!";
    accuseMurder[2] = partOne + "Mr. Moskowitz is the murderer!";
    accuseMurder[3] = partOne + "Mrs. Kipp is the murderer!";
    accuseMurder[4] = partOne + "Mrs. Monroy is the murderer!";
    accuseMurder[5] = partOne + "Mrs. Valley is the murderer!";
    
  String[] accuseWeapon = new String[e];
    accuseWeapon[0] = partTwo + "an ID!";
    accuseWeapon[1] = partTwo + "a whirligig!";
    accuseWeapon[2] = partTwo + "a deafening bell!";
    accuseWeapon[3] = partTwo + "Blinky the Robot!";
    accuseWeapon[4] = partTwo + "an exploding printer jam!";
    accuseWeapon[5] = partTwo + "a Null Pointer Exception!";
    accuseWeapon[5] = partTwo + "a An Answer That Wasn't In The PDF!";
    
  String[] accuseRoom = new String[u];
    accuseWeapon[0] = partThree + "the Auditorium!";
    accuseWeapon[1] = partThree + "the Fitness Center!";
    accuseWeapon[2] = partThree + "the MMC!";
    accuseWeapon[3] = partThree + "the New Room!";
    accuseWeapon[4] = partThree + "the Senior Lounge!";
    accuseWeapon[5] = partThree + "the Freshman Technology Lab!";
    accuseWeapon[5] = partThree + "Mrs. Valley's room!";
    accuseWeapon[5] = partThree + "Mrs. Pinto's room!";
    accuseWeapon[5] = partThree + "Mr. Pantaleo's room!";
  
  CPUBrain() {
    loc = new PVector(width/2, height/2);
    dim = new PVector();
  }
  
  void 
}
