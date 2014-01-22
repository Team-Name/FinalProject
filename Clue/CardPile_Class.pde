class CardPile {
  ArrayList<Card> cards;

  CardPile() {
    cards = new ArrayList<Card>();
    setUpCardPile();
  }

  Card[] getMurder() {
    boolean taken0,taken1,taken2;
    taken0=false;
    taken1=false;
    taken2=false;
    void select(){
      int i= int(random(cards.size()-1));
      Card c = cards.get(i);
    if(c.type==0){
     if(!taken0){
      cards.remove(i);
      taken0=true;
     } 
    }
    if(c.type==1){
     if(!taken1){
      cards.remove(i);
      taken1=true;
     } 
    }
    if(c.type==2){
     if(!taken2){
      cards.remove(i);
      taken2=true;
     } 
    }
    }
    if(!taken0||!taken1||!taken2){
     select(); 
    }
  }

  Card getRandomCard() {
    if(cards.size>0){
     Card c = cards.get(random(cards.size()-1);
    cards.remove(c);
    return c;
    }
    else{
     return null; 
    }
  }

  void setUpCardPile() {
    cards.add(new Card(0, "Ms. Gerstein"));
    cards.add(new Card(0, "Mr. Sanservino"));
    cards.add(new Card(0, "Mr. Moskowitz"));
    cards.add(new Card(0, "Mrs. Kipp"));
    cards.add(new Card(0, "Mrs. Monroy"));
    cards.add(new Card(0, "Mrs. Valley"));
    cards.add(new Card(1, "Auditorium"));
    cards.add(new Card(1, "Fitness Center"));
    cards.add(new Card(1, "MMC"));
    cards.add(new Card(1, "New Room"));
    cards.add(new Card(1, "Senior Lounge"));
    cards.add(new Card(1, "Mrs. Valley's Room"));
    cards.add(new Card(1, "Mrs. Pinto's Room"));
    cards.add(new Card(1, "Mr. Pantaleo's Room"));
    cards.add(new Card(1, "Freshman Tech Room"));
    cards.add(new Card(2, "ID"));
    cards.add(new Card(2, "Whirligig"));
    cards.add(new Card(2, "Deafening Bell"));
    cards.add(new Card(2, "Blinky the Robot"));
    cards.add(new Card(2, "Exploding Printer Jam"));
    cards.add(new Card(2, "Null Pointed Exception"));
    cards.add(new Card(2, "Supervolcano"));
    cards.add(new Card(2, "Answer That Wasn't In The PDF"));
  }

  void setUpAllCards(Card[] allCards) {
    allCards[0][0] = new Card(0, "Ms. Gerstein");
    allCards[0][1] = new Card(0, "Mr. Sanservino");
    allCards[0][2] = new Card(0, "Mr. Moskowitz");
    allCards[0][3] = new Card(0, "Mrs. Kipp");
    allCards[0][4] = new Card(0, "Mrs. Monroy");
    allCards[0][5] = new Card(0, "Mrs. Valley");
    allCards[1][0] = new Card(1, "Auditorium");
    allCards[1][1] = new Card(1, "Fitness Center");
    allCards[1][2] = new Card(1, "MMC");
    allCards[1][3] = new Card(1, "New Room");
    allCards[1][4] = new Card(1, "Senior Lounge");
    allCards[1][5] = new Card(1, "Mrs. Valley's Room");
    allCards[1][6] = new Card(1, "Mrs. Pinto's Room");
    allCards[1][7] = new Card(1, "Mr. Pantaleo's Room");
    allCards[1][8] = new Card(1, "Freshman Tech Room");
    allCards[2][0] = new Card(2, "ID");
    allCards[2][1] = new Card(2, "Whirligig");
    allCards[2][2] = new Card(2, "Deafening Bell");
    allCards[2][3] = new Card(2, "Blinky the Robot");
    allCards[2][4] = new Card(2, "Exploding Printer Jam");
    allCards[2][5] = new Card(2, "Null Pointed Exception");
    allCards[2][6] = new Card(2, "Supervolcano");
    allCards[2][7] = new Card(2, "Answer That Wasn't In The PDF");
  }
}

