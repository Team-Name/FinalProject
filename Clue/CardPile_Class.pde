class CardPile {
  ArrayList<Card> cards;

  CardPile() {
    cards = new ArrayList<Card>();
    setUpCardPile();
  }

  //returns a murder and removes cards from cardpile
  Card[] getMurder() {
    boolean taken0, taken1, taken2;
    taken0=false;
    taken1=false;
    taken2=false;
    Card[] murder = new Card[3];
    while (!taken0||!taken1||!taken2) {
      int i = int(random(cards.size()-1));
      Card c = cards.get(i);
      if (c.type==0 && !taken0) {
        cards.remove(i);
        murder[0] = c;
        taken0=true;
      }
      if (c.type==1 && !taken1) {
        cards.remove(i);
        murder[1] = c;
        taken1=true;
      }
      if (c.type==2 && !taken2) {
        cards.remove(i);
        murder[2] = c;
        taken2=true;
      }
    }
    return murder;
  }

  //returns random card and removes it from pile
  Card getRandomCard() {
    if (cards.size()>0) {
      int i = int(random(cards.size()-1));
      Card c = cards.get(i);
      cards.remove(i);
      return c;
    }
    else {
      return null;
    }
  }

  //sets up card pile
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
    cards.add(new Card(2, "Null Pointer Exception"));
    cards.add(new Card(2, "Supervolcano"));
    cards.add(new Card(2, "Answer That Wasn't In The PDF"));
  }

  //sets up teachers
  ArrayList<Card> setUpTeachers() {
    ArrayList<Card> teacherCards = new ArrayList<Card>();
    teacherCards.add(new Card(0, "Ms. Gerstein"));
    teacherCards.add(new Card(0, "Mr. Sanservino"));
    teacherCards.add(new Card(0, "Mr. Moskowitz"));
    teacherCards.add(new Card(0, "Mrs. Kipp"));
    teacherCards.add(new Card(0, "Mrs. Monroy"));
    teacherCards.add(new Card(0, "Mrs. Valley"));
    return teacherCards;
  }

  //sets up rooms
  ArrayList<Card> setUpRooms() {
    ArrayList<Card> roomCards = new ArrayList<Card>();
    roomCards.add(new Card(1, "Auditorium"));
    roomCards.add(new Card(1, "Fitness Center"));
    roomCards.add(new Card(1, "MMC"));
    roomCards.add(new Card(1, "New Room"));
    roomCards.add(new Card(1, "Senior Lounge"));
    roomCards.add(new Card(1, "Mrs. Valley's Room"));
    roomCards.add(new Card(1, "Mrs. Pinto's Room"));
    roomCards.add(new Card(1, "Mr. Pantaleo's Room"));
    roomCards.add(new Card(1, "Freshman Tech Room"));
    return roomCards;
  }

  //sets up weapons
  ArrayList<Card> setUpWeapons() {
    ArrayList<Card> weaponCards = new ArrayList<Card>();
    weaponCards.add(new Card(2, "ID"));
    weaponCards.add(new Card(2, "Whirligig"));
    weaponCards.add(new Card(2, "Deafening Bell"));
    weaponCards.add(new Card(2, "Blinky the Robot"));
    weaponCards.add(new Card(2, "Exploding Printer Jam"));
    weaponCards.add(new Card(2, "Null Pointed Exception"));
    weaponCards.add(new Card(2, "Supervolcano"));
    weaponCards.add(new Card(2, "Answer That Wasn't In The PDF"));
    return weaponCards;
  }
}

