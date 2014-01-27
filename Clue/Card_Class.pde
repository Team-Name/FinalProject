class Card {
  PImage cardPic;
  int type; //0 is suspect, 1 is room, 2 is weapon
  String detail;
  
  Card(int myType, String myDetail) {
    type = myType;
    detail = myDetail;
  }
  
  //returns if detail of card equals detail of another
  boolean equal(Card other) {
    if (detail.equals(other.detail)) {
      return true;
    }
    return false;
  }
}


