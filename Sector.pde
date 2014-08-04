class Sector {
  int x, y, dim;
  int circles;
  
  FloatList circleDists = new FloatList();
  ArrayList<PVector> sqPoints = new ArrayList<PVector>();
  
  Sector(int _x, int _y, int _dim) {
    x       = _x;
    y       = _y;
    dim     = _dim;
    circles = int(random(2,5));
    setupCircleRadii();
    setupCenterSquare();
  }
  
  void setupCircleRadii(){
    float rad;
    // Set up the primary circle for square boundaries
    float primCirPerc = random(0.15,0.6);
    
    float primCirRad  = dim * primCirPerc;
    circleDists.append(primCirRad);
    for(int i = 1; i < circles; i++){
      float r = random(primCirPerc,0.9);
      circleDists.append(dim*r);
    }
  }
  
  void setupCenterSquare(){
    float sqRad = circleDists.get(0) * 0.5;
    float ptX = sin(radians(0))*sqRad;
    float ptY = cos(radians(0))*sqRad;
    
    PVector pv0 = new PVector(ptX,ptY);
    sqPoints.add(pv0);
    
    ptX = sin(radians(90))*sqRad;
    ptY = cos(radians(90))*sqRad;
    PVector pv1  = new PVector(ptX,ptY);
    sqPoints.add(pv1);
    
    ptX = sin(radians(180))*sqRad;
    ptY = cos(radians(180))*sqRad;
    PVector pv2  = new PVector(ptX,ptY);
    sqPoints.add(pv2);
    
    ptX = sin(radians(270))*sqRad;
    ptY = cos(radians(270))*sqRad;
    PVector pv3  = new PVector(ptX,ptY);
    sqPoints.add(pv3);
  }

  void display() {
    pushMatrix();
    translate(x + dim/2.0, y + dim/2.0);
    if (debug) drawBoundingBox();
    if (debug) drawCircles();
    drawCenterSquare();
    popMatrix();
  }
  
  void drawCenterSquare(){
    noStroke();
    noFill();
    stroke(255,0,0);
    strokeWeight(1);
    
    PVector p1 = sqPoints.get(0);
    PVector p2 = sqPoints.get(1);
    PVector p3 = sqPoints.get(2);
    PVector p4 = sqPoints.get(3);
    
    int rot = int(random(90));
    rotate(rot);
    
   beginShape();
   vertex(p1.x,p1.y);
   vertex(p1.x,p1.y);
   vertex(p2.x,p2.y);
   vertex(p3.x,p3.y);
   vertex(p4.x,p4.y);
   vertex(p1.x,p1.y);
   
   endShape();
   rotate(-rot);
     
  }
  
  void drawCircles() {
    // Outer Circle
    noFill();
    stroke(128);
    strokeWeight(1);
    ellipse(0,0,dim,dim);

    
    // Other Circles
    for(float f:circleDists){
      stroke(int(random(200)));
      ellipse(0,0,f,f);
    }
    
    noStroke();
  }

  void drawBoundingBox() {
    noFill();
    stroke(128);
    strokeWeight(1);
    rect(-dim/2.0, -dim/2.0, dim, dim);
    noStroke();
  }
}

