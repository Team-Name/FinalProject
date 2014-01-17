Card[] murder;
ComputerPlayers[] cplayers;



boolean run, inst;
Start st;
void setup() {
  size(500, 500);
  run=false;
  inst=false;
  st=new Start();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  colorMode(HSB,360,100,100);
}
void draw() {
  if (run) {
    background(0);
  }
  else {
    if(inst){
     st.showRules(); 
    }
    else{
    st.display();
    }
  }
}
void mousePressed() {
  if (!run) {
    st.changeRun(); 
    st.rules();
  }
}

