boolean run;
Start st;
void setup() {
  size(500, 500);
  run=false;
  inst=false;
  st=new Start();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  colorMode(HSB);
}
void draw() {
  if (run) {

    background(0);
  }
  else {
      st.display();
  }
}
void mousePressed() {
  st.changeRun(); 
  st.rules();
}

