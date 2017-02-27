Figure currentFigure;
ArrayList<Figure> figuresStack;
int flickeringChance = 99;
int brightness = 0;
int backgroundHue = 0;

void setup(){
  //size(2600,1400);
  fullScreen();
  noCursor();
  blendMode(LIGHTEST);
  currentFigure = new Figure(6);
  figuresStack = new ArrayList<Figure>();
}

void draw(){
  colorMode(HSB, 100);
  background(backgroundHue,100,brightness);
  for(int i = 0; i < figuresStack.size(); i++){
   figuresStack.get(i).display(); 
   figuresStack.get(i).lifeTime--;
   if(figuresStack.get(i).lifeTime <= 0){
    figuresStack.remove(i); 
   }
  }
}

void keyPressed(){
 if (key == 'q' || key == 'Q'){
  figuresStack.add(new Figure(floor(random(3,8)))); 
 }
 if (keyCode == DOWN){
  flickeringChance--;
 }
 if (keyCode == UP){
  flickeringChance++;
 }
 if (keyCode == RIGHT){
  brightness++;
 }
 if (keyCode == LEFT){
  brightness--;
 }
  if (key == 'p' || key == 'P'){
  backgroundHue = (int)random(0,100);
 }
 if (key == 'r' || key == 'R'){
  flickeringChance = 99;
 }
}