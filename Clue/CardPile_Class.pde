class CardPile {
  ArrayList<Card> cards;

  CardPile() {
    cards = new ArrayList<Card>();
    setUpCardPile();
  }

  Card[] getMurder() {
    boolean taken0, taken1, taken2;
    taken0=false;
    taken1=false;
    taken2=false;
    void select() {
      int i= int(random(cards.size()-1));
      Card c = cards.get(i);
      if (c.type==0) {
        if (!taken0) {
          cards.remove(i);
          taken0=true;
        }
      }
      if (c.type==1) {
        if (!taken1) {
          cards.remove(i);
          taken1=true;
        }
      }
      if (c.type==2) {
        if (!taken2) {
          cards.remove(i);
          taken2=true;
        }
      }
    }
    if (!taken0||!taken1||!taken2) {
      select();
    }
  }

  Card getRandomCard() {
    if (cards.size>0) {
      Card c = cards.get(random(cards.size()-1);
      cards.remove(c);
      return c;
    }
    else {
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

  void setUpCardArray(Card[] allCards) {
    allCards = new Card[3];
    ArrayList<Card> teacherCards = new ArrayList<Card>();
    ArrayList<Card> roomCards = new ArrayList<Card>();
    ArrayList<Card> weaponCards = new ArrayList<Card>();  
    teacherCards.add(new Card(0, "Ms. Gerstein"));
    teacherCards.add(new Card(0, "Mr. Sanservino"));
    teacherCards.add(new Card(0, "Mr. Moskowitz"));
    teacherCards.add(new Card(0, "Mrs. Kipp"));
    teacherCards.add(new Card(0, "Mrs. Monroy"));
    teacherCards.add(new Card(0, "Mrs. Valley"));
    roomCards.add(new Card(1, "Auditorium"));
    roomCards.add(new Card(1, "Fitness Center"));
    roomCards.add(new Card(1, "MMC"));
    roomCards.add(new Card(1, "New Room"));
    roomCards.add(new Card(1, "Senior Lounge"));
    roomCards.add(new Card(1, "Mrs. Valley's Room"));
    roomCards.add(new Card(1, "Mrs. Pinto's Room"));
    roomCards.add(new Card(1, "Mr. Pantaleo's Room"));
    roomCards.add(new Card(1, "Freshman Tech Room"));
    weaponCards.add(new Card(2, "ID"));
    weaponCards.add(new Card(2, "Whirligig"));
    weaponCards.add(new Card(2, "Deafening Bell"));
    weaponCards.add(new Card(2, "Blinky the Robot"));
    weaponCards.add(new Card(2, "Exploding Printer Jam"));
    weaponCards.add(new Card(2, "Null Pointed Exception"));
    weaponCards.add(new Card(2, "Supervolcano"));
    weaponCards.add(new Card(2, "Answer That Wasn't In The PDF"));
    allCards[0] = teacherCards;
    allCards[1] = roomCards;
    allCards[2] = weaponCards;
  }
}

