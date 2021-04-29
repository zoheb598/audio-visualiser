//created project, testing github
//import nessecary stuff
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioBuffer ab;
AudioPlayer ap;

FFT fft;

void setup()
{
  timeStart = millis();
  size(1024, 1080, P3D); //set to 3d render
  colorMode(HSB);

  minim = new Minim(this);

  ap = minim.loadFile("RUDE - Eternal Youth.mp3", width); //load song
  ap.play();

  ab = ap.mix;

  fft = new FFT(width, 44100);
}

float theta = 0;
float speed = -0.01f;
float lerpedAverage = 0;
float randomX = 0;
float randomY = 0;
float gradualX = 0;
float gradualY = 0;
float mirrorGradualX = 0;
float mirrorGradualY = 0;

boolean bass = false;
int timeStart;
int timeElapsed;
int bassCount = 0;

float z = 0;
float moveSpeed = 1;

float lerpedFrequency = 0;


void draw() {
  timeElapsed = millis() - timeStart;
  cube();
  miniCube();
  ring();
}

void cube() {
  float sum = 0;
  for (int i = 0; i < ab.size(); i ++)
  {
    sum += abs(ab.get(i));
  }
  //print('\n', sum);
  float average = sum / (float) ab.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  stroke(sum, 255, 255);
  background(0);
  strokeWeight(3);
  noFill();
  lights();
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(theta);
  rotateY(theta);
  rotateZ(theta);
  box(100 + (lerpedAverage * 500));
  popMatrix();

  theta += speed;
}


void miniCube() {
  //frequncy check
  fft.window(FFT.HAMMING);
  fft.forward(ab);
  int highestBin = -1;
  float highest = 0;
  for (int i = 0; i < fft.specSize(); i ++)
  {
    if (fft.getBand(i) > highest)
    {
      highest = fft.getBand(i);
      highestBin = i;
    }
  }
  float freq = fft.indexToFreq(highestBin);
  text("Freq: " + freq, 100, 200);
  //if bass
  if(freq > 42 && freq < 44 && bass){
  randomX = random(width);
  randomY = random(height);
  //timeStart = millis();
  bass = false;
  }
  if(freq > 44){
   bassCount++;  
  }
  if(bassCount > 5){
    bass = true;
    bassCount = 0;
  }
  //cube 1
  pushMatrix();
  translate(gradualX, gradualY, 0);
  rotateX(theta*5);
  rotateY(theta*5);
  rotateZ(theta);
  box(10 + (lerpedAverage *200)); 
  popMatrix();
  //cube 2
  pushMatrix();
  translate(gradualY, gradualX, 0);
  rotateX(theta*5);
  rotateY(theta*5);
  rotateZ(theta);
  box(10 + (lerpedAverage *200)); 
  popMatrix();
  //cube 3
  pushMatrix();
  translate(height-gradualX, width-gradualY, 0);
  rotateX(theta*5);
  rotateY(theta*5);
  rotateZ(theta);
  box(10 + (lerpedAverage *200)); 
  popMatrix();
  //cube 4
  pushMatrix();
  translate(height-gradualY, width-gradualX, 0);
  rotateX(theta*5);
  rotateY(theta*5);
  rotateZ(theta);
  box(10 + (lerpedAverage *200)); 
  popMatrix();
  if (gradualX != randomX) {
    gradualX = lerp(gradualX, randomX, 0.05);
  }
  if (gradualY != randomY) {
    gradualY = lerp(gradualY, randomY, 0.05);
  }
}

void ring() {
  stroke(100, 255, 255);
  strokeWeight(3);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 50 + (lerpedAverage * 600), 50 + (lerpedAverage * 600));
}

void keyReleased() {
  randomX = random(width);
  randomY = random(height);
}
