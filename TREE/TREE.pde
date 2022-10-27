//modified tree
//original code by Dan Shiffman
//https://processing.org/examples/tree.html
import peasy.*;

int[] shapes = {90,18,135,250};
int shapecount = 0;
 
float theta;   

boolean shapeswitch = true;

float a = 0; 

PeasyCam cam;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  stroke(random(pmouseX), random(pmouseY), abs(pmouseX-pmouseY));
  strokeWeight(3);
  frameRate(30);
  
  
  if(shapeswitch){
   a = shapes[shapecount];}
  
  else{
    a = frameCount*2.0;
  }
  
 // println(a);
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/20,(height/8)+150);
  // Draw a line 120 pixels
  line(-40,-100,-40,-height/3);
  // Move to the end of that line
  translate(-40,-height/3);
  // Start the recursive branching!
  branch(180);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 1) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(10, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
  }
}

void mouseReleased(){
  shapecount++;
  shapecount = shapecount%shapes.length;
  
}

void keyPressed(){
  shapeswitch = !shapeswitch;;
  
}
