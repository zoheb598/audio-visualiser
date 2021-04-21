//created project, testing github
//import nessecary stuff
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

void setup()
{
  size(800, 800, P3D); //set to 3d render
  colorMode(HSB);

  minim = new Minim(this);

  ap = minim.loadFile("RUDE - Eternal Youth.mp3", width); //load song
  ap.play();

  ab = ap.mix;
}

float theta = 0;
float speed = -0.01f;
float lerpedAverage = 0;
float randomX = width/2;
float randomY = height/2;
float randomZ = 0;
float gradualX = 0;
float gradualY = 0;
Minim minim;
AudioBuffer ab;
AudioPlayer ap;

float z = 0;
float moveSpeed = 1;


void draw() {
  cube();
  miniCube();
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> d108191337deb95355a129e17de66e1c93f7cf5e
=======
>>>>>>> d108191337deb95355a129e17de66e1c93f7cf5e
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
  box(100 + (lerpedAverage * 500));
  popMatrix();
  theta += speed;
}

void miniCube() {
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

  box(100 + (lerpedAverage * 600));
  theta += speed;
  
  pushMatrix();
  translate(width / 4, height / 4, 0);
  sphere(80 + (lerpedAverage * 200));
  popMatrix();
  theta += speed;
  z -= moveSpeed;
  
 
=======
  box(100 + (lerpedAverage * 500));
  popMatrix();
  theta += speed; 
}

void miniCube(){
=======
  box(100 + (lerpedAverage * 500));
  popMatrix();
  theta += speed;
}

void miniCube() {
>>>>>>> d108191337deb95355a129e17de66e1c93f7cf5e
=======
  box(100 + (lerpedAverage * 500));
  popMatrix();
  theta += speed;
}

void miniCube() {
>>>>>>> d108191337deb95355a129e17de66e1c93f7cf5e
>>>>>>> Stashed changes
  pushMatrix();
  translate(gradualX, gradualY, 0);
  rotateX(theta*5);
  rotateY(theta*5);
  rotateZ(theta);
  box(10 + (lerpedAverage *500)); 
  popMatrix();
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
<<<<<<< HEAD
      if(gradualX != randomX){
      gradualX++;
    }
}

void keyReleased(){
    randomX = random(800);
    randomY = random(800);
    randomZ = random(200);
>>>>>>> bf944ab2d951ead1c42636eef2db1e258d45b973
=======
=======
>>>>>>> d108191337deb95355a129e17de66e1c93f7cf5e
>>>>>>> Stashed changes
  if (gradualX != randomX) {
    gradualX = lerp(gradualX, randomX, .05);
  }
  if(gradualX != randomY){
   gradualY = lerp(gradualY, randomY, .05);
  }
}

void keyReleased() {
  randomX = random(800);
  randomY = random(800);
  randomZ = random(200);
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
>>>>>>> d108191337deb95355a129e17de66e1c93f7cf5e
=======
>>>>>>> d108191337deb95355a129e17de66e1c93f7cf5e
>>>>>>> Stashed changes
}
