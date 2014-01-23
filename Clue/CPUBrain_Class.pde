
// methods: get-Accusation
// variables: boolean (turn), clue cards, accusation strings

class CPUBrain {
  int i, e, u, r;
  i = 6;
  e = 6;
  u = 6;
  r = 6;
  boolean turnp1, turnp2, turnp3, turnp4, ;
  String easterEggs;
  String[] accuseMurder = new String[i];
  accuseMurder[0] = "Ms. Gerstein";
  accuseMurder[1] = "Mr. Sanservino";
  accuseMurder[2] = "Mr. Moskowitz";
  accuseMurder[3] = "Mrs. Kipp";
  accuseMurder[4] = "Mrs. Monroy";
  accuseMurder[5] = "Mrs. Valley";

  String[] accuseWeapon = new String[e];
  accuseWeapon[0] = "an ID";
  accuseWeapon[1] = "a whirligig";
  accuseWeapon[2] = "a deafening bell";
  accuseWeapon[3] = "Blinky the Robot";
  accuseWeapon[4] = "an exploding printer jam";
  accuseWeapon[5] = "a Null Pointer Exception";
  accuseWeapon[5] = "a An Answer That Wasn't In The PDF";

  String[] accuseRoom = new String[u];
  accuseWeapon[0] = "the Auditorium";
  accuseWeapon[1] = "the Fitness Center";
  accuseWeapon[2] = "the MMC";
  accuseWeapon[3] = "the New Room";
  accuseWeapon[4] = "the Senior Lounge";
  accuseWeapon[5] = "the Freshman Technology Lab";
  accuseWeapon[5] = "Mrs. Valley's room";
  accuseWeapon[5] = "Mrs. Pinto's room";
  accuseWeapon[5] = "Mr. Pantaleo's room";

  String[] easterEggs = new String[r];
  easterEggs[0] = "//"
    easterEggs[1] = "//"
    easterEggs[2] = "//"
    easterEggs[3] = "//"
    easterEggs[4] = "//"
    easterEggs[5] = "//"

    CPUBrain() {
    // turn initializations (to be finalized w/ rest of code)
    if () {
      turnp1 = true; 
      turnp2 = false; 
      turnp3 = false; 
      turnp4 = false;
    }
    else if () {
      turnp1 = false; 
      turnp2 = true; 
      turnp3 = false; 
      turnp4 = false;
    }
    else if () {
      turnp1 = false; 
      turnp2 = false; 
      turnp3 = true; 
      turnp4 = false;
    }
    else if () {
      turnp1 = false; 
      turnp2 = false; 
      turnp3 = false; 
      turnp4 = true;
    }
  }

  void formAccusation() {
    if (turnp1 == true) {
    }
    else if (turnp2 == true) {
      if (suspect1 is not cleared) {
        text("I think that " + accuseMurder[0] + " is the murderer!", locationX, locationY);
      } 
      else if (suspect2 is not cleared) {
        text("I think that " + accuseMurder[1] + " is the murderer!", locationX, locationY);
      }
      else if (suspect3 is not cleared) {
        text("I think that " + accuseMurder[2] + " is the murderer!", locationX, locationY);
      }
      else if (suspect4 is not cleared) {
        text("I think that " + accuseMurder[3] + " is the murderer!", locationX, locationY);
      }
      else if (suspect5 is not cleared) {
        text("I think that " + accuseMurder[4] + " is the murderer!", locationX, locationY);
      }
      else if (suspect6 is not cleared) {
        text("I think that " + accuseMurder[5] + " is the murderer!", locationX, locationY);
      }
    }
    else if (turnp3 == true) {
    }
    else if (turnp4 == true) {
    }
  }

