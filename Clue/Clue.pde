boolean run, inst, gameOver, win; //win will have to be made true or false when the accusation is made
Start st;
End e;
void setup() {
  size(500, 500);
  run=false;
  inst=false;
  gameOver=true;
  st=new Start();
  e=new End();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  colorMode(HSB,360,100,100);
}
void draw() {
  if (run) {
    if(!gameOver){
    background(0);
    }
    if(gameOver){
      e.display();
    }
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
  if(gameOver){
    e.restart();
  }
}

