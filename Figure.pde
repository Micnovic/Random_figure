import toxi.math.*;

class Figure{
   int lifeTime = 300;
   int n;
   float clr;
   float rotation;
   float flickerRotation = PI/128;
   float flickerPosition = 50;
   float initialSize = 100;
   float currentSize;
   ScaleMap logMap = new ScaleMap(0, 100, 0, 100);
   Figure(int numberOfPoints){
     n = numberOfPoints;
     rotation = (PI/2)+random(-PI/32, PI/32);
     clr = random(0,100);
     currentSize = initialSize;
   }
   void display(){
     pushMatrix();
     noStroke();
     colorMode(HSB, 100);
     fill(clr, 100, 100, lifeTime);
     
     if(random(0,100) > flickeringChance){
       translate(width/2 + random(-flickerPosition, flickerPosition), height/2 + random(-flickerPosition, flickerPosition));
     } else {
       translate(width/2, height/2);
     }
     if(flickeringChance < 98){
       rotate(rotation + random(-flickerRotation, flickerRotation));
     }
     beginShape();
     float step = (2*PI)/n;
     currentSize--;
     for(float i = 0; i <= 2*PI; i+=step){
       float scale = (float)logMap.getMappedValueFor(log(currentSize));
       vertex(cos(i)*scale*(width/30), sin(i)*scale*(width/30));
       //vertex(cos(i)*currentSize, sin(i)*currentSize);
     }
     endShape(CLOSE);
     popMatrix();
   }
   
}