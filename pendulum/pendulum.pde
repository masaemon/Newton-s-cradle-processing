import fisica.*;
FWorld world;
FCircle [] circle;
FDistanceJoint [] joint;
FBox [] box;

int ballnum = 5;

int ballsize = 60;

void setup(){
  size(1000, 500);
  Fisica.init(this);
  world = new FWorld();
  drawpendulum();
}

void drawpendulum(){
  
  
  int centerball = ballnum / 2;
  
  box = new FBox[ballnum];
  circle = new FCircle[ballnum];
  joint = new FDistanceJoint[ballnum];
  
  for(int i = 0; i < ballnum; i++){
    box[i] = new FBox(ballsize, ballsize);
    box[i].setStatic(true);
    box[i].setPosition(width/2 + ballsize*(i - centerball)+1, 100);
    world.add(box[i]);
    
    circle[i] = new FCircle(ballsize-2);
    circle[i].setPosition(width/2 + ballsize*(i - centerball)+1, 300);
    circle[i].setRestitution(1);
    circle[i].setDensity(0.5);
    circle[i].setBullet(true);
    circle[i].setFriction(0);
    circle[i].setDamping(0);
    
    joint[i] = new FDistanceJoint(circle[i], box[i]);
    
    world.add(circle[i]);
    world.add(joint[i]);
  }
  
}

void draw(){
  background(255); 
  world.step();
  world.draw();
}