import controlP5.*;

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
int total = 75;
PVector [][] shape;
ControlP5 cp5;
ControlP5 cp51;
ControlWindow controlWindow;
int myColor = color(0,0,0);
int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 30;
Slider abc;

void setup(){
  size(1000,1000,P3D);
  cam = new PeasyCam(this, 800);
  shape = new PVector[total+1][total+1];
  cp5 = new ControlP5(this);
  cp51 = new ControlP5(this);
  
  
    cp5.addTab("INPUT")
      .setColorBackground(color(0, 160, 100))
      .setColorLabel(color(255))
      .setColorActive(color(255,128,0))
      ;
      
    cp5.getTab("default")
     .activateEvent(true)
     .setLabel("my default tab")
     .setId(1)
     ;

    cp5.getTab("extra")
     .activateEvent(true)
     .setId(2)
     ;
    
    cp5.addSlider("sliderValue")
    .setPosition(230, 100)
    .setRange(0,255)
    ;
   
    
}

void draw(){
  if(controlWindow(this).isMouseOver()){
    cam.setActive(false);
  }
  else{
    cam.setActive(true);
  }
  
  background(0);
  noStroke();
  lights();
  
   float r = 200;
  for(int i = 0; i <= total; i++){
      float theta = map(i, 0, total, -HALF_PI, HALF_PI);
      float r2 = supershape(theta,2,10,10,10);
    for(int j = 0; j <= total; j++){
        float phi = map(j, 0, total, -PI, PI);
        float r1 = supershape(phi,8,60,100,30);
        float x = r * r1 * cos(phi) * r2 *cos(theta);
        float y = r * r1 * sin(phi) * r2 * cos(theta);
        float z = r * r2 * sin(theta);
        shape[i][j] = new PVector(x,y,z);
    
    }
    
  }
  for(int i = 0; i < total; i++){ 
    beginShape(TRIANGLE_STRIP);
    for(int j = 0; j < total+1; j++){
      PVector v1 = shape[i][j];
      stroke(255);
      strokeWeight(2);
      vertex(v1.x,v1.y,v1.z);
      
      PVector v2 = shape[i+1][j];
      vertex(v2.x,v2.y,v2.z);

      
      
    }
    endShape();
  }
  
  
}
float a = 1;
float b = 1;

float supershape(float theta, float m, float n1, float n2, float n3){
  
  float t1 = abs((1/a)*cos(m * theta / 4));
  t1 = pow(t1,n2);
  float t2 =abs((1/b*sin(m * theta/4)));
  t2 = pow(t2,n3);
  float function = t1 + t2;
  float r = pow(function, -1 / n1);
  return r;
  
}