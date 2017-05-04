import controlP5.*;
import peasy.*;
import processing.opengl.*;
/**
/*----SUPER*TOPO*MORPH-----
/*
/*William Keely
/*
/*
/*INSPIRED BY: 
/*http://paulbourke.net/geometry/supershape/
/*
/*CONTROL P5:
/*https://github.com/sojamo/controlp5
/*
**/

//vars for CAMERA MATRIX
PeasyCam camera;
PMatrix3D pm3;
ControlP5 control;
//GRAPHICS, VECTORS, SUPER VALUES
PGraphics3D pg3;
PVector[][] vector;
float a1, a2, b1, b2, m1, m2, n11, n12, n21, n22, n31, n32, theta, phi, x, y ,z;
int scaler, iterator, btnMesh, btnPoints, btnSolid, spr1, spr2;
boolean toroid;

void setup(){
  fullScreen(OPENGL);
  //size(900,900,OPENGL);
  pg3 = (PGraphics3D)g;
  camera = new PeasyCam(this, 1200);
  control = new ControlP5(this);
  
  toroid = false;
  
  spr1 = 1;
  spr2 = 1;
  btnPoints = 1;
  btnMesh = 0;
  btnSolid = 0;
  a1 = 1;
  a2 = 1;
  b1 = 1;
  b2 =1;
  m1 = 0.5;
  m2 = 0.5;
  n11 = 0.5;
  n12 = 0.5;
  n21 = 0.5;
  n22= 0.5;
  n31 = 0.5;
  n32 = 0.5;
  scaler = 200;
  iterator = 75;
  btnMesh = 1;
  btnPoints = 0;
  btnSolid = 0;
  vector = new PVector[iterator + 1][iterator + 1];
  
  //NOTE FOR SLIDERS
  //control.addSlider("Name",min range,max range,starting val,
  //x-coord,y-coord,width,height); if width is smaller than height
  //then the slider will be verticle.
  
  //NOTE FOR BUTTONS
  //control.addButton("Name", value, x-coord, y-coord, width, height);
  
  //sliders for Super 1
  control.addSlider("A1",0.0,2.0,1.0,100,120,20,80);
  control.addSlider("B1",0.0,2.0,1.0,140,120,20,80);
  control.addSlider("M1",-25.0,25.0,1.2,180,120,20,80);
  control.addSlider("N11",-25.0,25.0,.30,220,120,20,80);
  control.addSlider("N21",-25.0,25.0,.30,260,120,20,80);
  control.addSlider("N31",-25.0,25.0,.30,300,120,20,80);
  
  //sliders for Super 2
  control.addSlider("A2",0.0,2.0,1.0,100,230,20,80);
  control.addSlider("B2",0.0,2.0,1.0,140,230,20,80);
  control.addSlider("M2",-25.0,25.0,0.0,180,230,20,80);
  control.addSlider("N12",-25.0,25.0,1.0,220,230,20,80);
  control.addSlider("N22",-25.0,25.0,1.0,260,230,20,80);
  control.addSlider("N32",-25.0,25.0,1.0,300,230,20,80);
  
  //buttons
  control.addButton("SUPER_1");
  control.addButton("SUPER_2");
  control.addButton("SPHERE");
  control.addButton("TORUS");
  control.addButton("MESH");
  control.addButton("POINTS").setLabel("P0!NTS");
  control.addButton("SOLIDS");
  
  control.setAutoDraw(false);
  
  
  
  
}

void draw(){
  background(0,0,0);
  setA1(control.get("A1").getValue());
  setA2(control.get("A2").getValue());
  setB1(control.get("B1").getValue());
  setB2(control.get("B2").getValue());
  setM1(control.get("M1").getValue());
  setM2(control.get("M2").getValue());
  setN11(control.get("N11").getValue());
  setN12(control.get("N12").getValue());
  setN21(control.get("N21").getValue());
  setN22(control.get("N22").getValue());
  setN31(control.get("N31").getValue());
  setN32(control.get("N32").getValue());
  
  
  
  if(btnPoints == 1){
    drawPoints();
  }
  else if(btnMesh == 1){
    drawMesh();
  }
  else if(btnSolid == 1){
    drawSolid();
  }
  else{
    //nothing
  }
  

  GUI();
  
  
  if(spr1 == 1){
    control.get("A1").show();
    control.get("B1").show();
    control.get("M1").show();
    control.get("N11").show();
    control.get("N21").show();
    control.get("N31").show();
  }
  else{
    control.get("A1").hide();
    control.get("B1").hide();
    control.get("M1").hide();
    control.get("N11").hide();
    control.get("N21").hide();
    control.get("N31").hide();
  }
  if(spr2 == 1){
    control.get("A2").show();
    control.get("B2").show();
    control.get("M2").show();
    control.get("N12").show();
    control.get("N22").show();
    control.get("N32").show();
  }
  else{
    control.get("A2").hide();
    control.get("B2").hide();
    control.get("M2").hide();
    control.get("N12").hide();
    control.get("N22").hide();
    control.get("N32").hide();
  }
  
 
  
  
}
//SUPER EQUATIONS
float superEq1(float theta, float m, float n1, float n2, float n3){
  float part1 = pow((abs((1/a1)*cos(m * theta / 4))), n2);
  float part2 = pow((abs((1/b1*sin(m * theta/4)))), n3);
  float r = pow((part1 + part2), -1/n1);
  return r;
}

float superEq2(float theta, float m, float n1, float n2, float n3){
  float part1 = pow((abs((1/a2)*cos(m * theta / 4))), n2);
  float part2 = pow((abs((1/b2*sin(m * theta/4)))), n3);
  float r = pow((part1 + part2), -1/n1);
  return r;
}

//SETTERS SUPER 1
public void setA1(float a){
  this.a1 = a;
}
public void setB1(float b){
  this.b1 = b;
}
public void setM1(float m){
  this.m1 = m;
}
public void setN11(float n1){
  this.n11 = n1;
}
public void setN21(float n2){
  this.n21 = n2;
}
public void setN31(float n3){
  this.n31 = n3;
}

//SETTERS SUPER 2
public void setA2(float a){
  this.a2 = a;
}
public void setB2(float b){
  this.b2 = b;
}
public void setM2(float m){
  this.m2 = m;
}
public void setN12(float n1){
  this.n12 = n1;
}
public void setN22(float n2){
  this.n22 = n2;
}
public void setN32(float n3){
  this.n32 = n3;
}

//ANGLE SETTERS -- NEVER USED
public void setTheta(float theta){
  this.theta = theta;
}
public void setPhi(float phi){
  this.phi = phi;
}

//GUI
void GUI(){
  pm3 = new PMatrix3D(pg3.camera);
  camera();
  control.draw();
  pg3.camera = pm3;
}

//MESH
public void drawMesh(){
  noFill();
  //SPHERE MAP
  if(toroid == false){
    for(int i = 0; i <= iterator; i++){
      theta = map(i, 0, iterator, -HALF_PI, HALF_PI);
      float r2 = superEq2(theta,m2,n12,n22,n32);
      for(int j = 0; j <= iterator; j++){
        phi = map(j, 0, iterator, -PI, PI);
        float r1 = superEq1(phi,m1,n11,n21,n31);
        float x = scaler * r1 * cos(phi) * r2 *cos(theta);
        float y = scaler * r1 * sin(phi) * r2 * cos(theta);
        float z = scaler * r2 * sin(theta);
        vector[i][j] = new PVector(x,y,z);    
      }
    }  
   
  
    for(int i = 0; i < iterator; i++){ 
      beginShape(TRIANGLE_STRIP);
      for(int j = 0; j < iterator+1; j++){
        PVector v1 = vector[i][j];
        stroke(255);
        strokeWeight(2);
        vertex(v1.x,v1.y,v1.z);
        PVector v2 = vector[i+1][j];
        vertex(v2.x,v2.y,v2.z);    
      }
      endShape();
    }
  }
  //TORUS MAP
  else{
    for(int i = 0; i <= iterator; i++){
      theta = map(i, 0, iterator, -PI, PI);
      float r1 = superEq2(theta,m2,n12,n22,n32);
      for(int j = 0; j <= iterator; j++){
        phi = map(j, 0, iterator, -PI, PI);
        float r2 = superEq1(phi,m1,n11,n21,n31);
        float x = scaler * cos(theta) * (r1 + ( r2 *cos(phi)));
        float y = scaler * sin(theta) * (r1 + (r2 * cos(phi)));
        float z = scaler * (r2* sin(phi));
        vector[i][j] = new PVector(x,y,z);    
      }
    }  
   
  
    for(int i = 0; i < iterator; i++){ 
      beginShape(TRIANGLE_STRIP);
      for(int j = 0; j < iterator+1; j++){
        PVector v1 = vector[i][j];
        stroke(255);
        strokeWeight(2);
        vertex(v1.x,v1.y,v1.z);
        PVector v2 = vector[i+1][j];
        vertex(v2.x,v2.y,v2.z);    
      }
      endShape();
    }
  }
}


//POINTS
public void drawPoints(){ //Mapping
  if(toroid == false){
    for(int i = 0; i <= iterator; i++){
        theta = map(i, 0, iterator, -HALF_PI, HALF_PI);
        float r2 = superEq2(theta,m2,n12,n22,n32);
        for(int j = 0; j <= iterator; j++){
          phi = map(j, 0, iterator, -PI, PI);
          float r1 = superEq1(phi,m1,n11,n21,n31);
          float x = scaler * r1 * cos(phi) * r2 *cos(theta);
          float y = scaler * r1 * sin(phi) * r2 * cos(theta);
          float z = scaler * r2 * sin(theta);
          stroke(255);
          strokeWeight(6);
          point(x,y,z);
        }
    }
  }
  else{
    for(int i = 0; i <= iterator; i++){
      theta = map(i, 0, iterator, -PI, PI);
      float r1 = superEq2(theta,m2,n12,n22,n32);
      for(int j = 0; j <= iterator; j++){
        phi = map(j, 0, iterator, -PI, PI);
        float r2 = superEq1(phi,m1,n11,n21,n31);
        float x = scaler * cos(theta) * (r1 + ( r2 *cos(phi)));
        float y = scaler * sin(theta) * (r1 + (r2 * cos(phi)));
        float z = scaler * (r2* sin(phi));
        stroke(255);
        strokeWeight(6);
        point(x,y,z);    
      }
    } 
  }
}
//SOLID
public void drawSolid(){
  
  lights();
  
  //Mapping SPHERE
  if(toroid == false){
    for(int i = 0; i <= iterator; i++){
        theta = map(i, 0, iterator, -HALF_PI, HALF_PI);
        float r2 = superEq2(theta,m2,n12,n22,n32);
      for(int j = 0; j <= iterator; j++){
          phi = map(j, 0, iterator, -PI, PI);
          float r1 = superEq1(phi,m1,n11,n21,n31);
          float x = scaler * r1 * cos(phi) * r2 *cos(theta);
          float y = scaler * r1 * sin(phi) * r2 * cos(theta);
          float z = scaler * r2 * sin(theta);
          vector[i][j] = new PVector(x,y,z);    
      }
    }  
   
  
    for(int i = 0; i < iterator; i++){ 
      fill(60,160,130);
      beginShape(TRIANGLE_STRIP);
      for(int j = 0; j < iterator+1; j++){
        PVector v1 = vector[i][j];
        stroke(60,160,130);
        strokeWeight(0);
        vertex(v1.x,v1.y,v1.z);
        PVector v2 = vector[i+1][j];
        vertex(v2.x,v2.y,v2.z);    
      }
      endShape();
    }
  }
  //TORUS MAP
  else{
    for(int i = 0; i <= iterator; i++){
      theta = map(i, 0, iterator, -PI, PI);
      float r1 = superEq2(theta,m2,n12,n22,n32);
      for(int j = 0; j <= iterator; j++){
        phi = map(j, 0, iterator, -PI, PI);
        float r2 = superEq1(phi,m1,n11,n21,n31);
        float x = scaler * cos(theta) * (r1 + ( r2 *cos(phi)));
        float y = scaler * sin(theta) * (r1 + (r2 * cos(phi)));
        float z = scaler * (r2* sin(phi));
        vector[i][j] = new PVector(x,y,z);    
      }
    }
    for(int i = 0; i < iterator; i++){ 
      fill(40,110,190);
      beginShape(TRIANGLE_STRIP);
      for(int j = 0; j < iterator+1; j++){
        PVector v1 = vector[i][j];
        stroke(40,110,190);
        strokeWeight(0);
        vertex(v1.x,v1.y,v1.z);
        PVector v2 = vector[i+1][j];
        vertex(v2.x,v2.y,v2.z);    
      }
      endShape();
    }
  }
}


public void SUPER_1(){
  if(spr1 == 0){
    spr1 = 1;
  }
  else{
    spr1 = 0;
  }
}
public void SUPER_2(){
  if(spr2 == 0){
    spr2 = 1;
  }
  else{
    spr2 = 0;
  }
}
public void MESH(){
  if(btnMesh == 0){
    btnMesh =1;
    btnSolid = 0;
    btnPoints = 0;
  }
}
public void POINTS(){
  if(btnPoints == 0){
    btnPoints = 1;
    btnMesh = 0;
    btnSolid = 0;
  }
}
public void SOLIDS(){
  if(btnSolid == 0){
    btnSolid = 1;
    btnPoints = 0;
    btnMesh = 0;
  }
}
public void TORUS(){
  if(toroid == false){
    toroid = true;
  }
}
public void SPHERE(){
  if(toroid == true){
    toroid = false;
  }
}