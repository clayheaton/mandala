boolean debug = true;
Sector s;


void setup() {
  size(600, 600); 
  smooth();
  background(255);
  s = new Sector(20, 20, width-40);
}

void draw() {
  background(255);
  s.display();
  noLoop();
}

