ExplosionObject explosion;
 
class ExplosionObject {
  float x, y;
  PImage spriteSheet;
  PImage[] animation;
  boolean explose;
  float currentFrame;
 
 
  ExplosionObject() {
    explose= true;
    currentFrame=0;
    x=0;
    y=0;
    setupSprite();
    updateExplosion();
  }
  
  void setupSprite() {
    animation = new PImage[14];
    spriteSheet= loadImage("image/effet/sprite2.png");
 
    for (int i=0; i<14; i++) {
      animation[i] = spriteSheet.get(127*i, 0, 128, 128);
     
    }
  }
  void afficherExplosion() {
    
      currentFrame = (currentFrame+0.15)%12;
   
      image(animation[1+int(currentFrame)], 0, 0);
     
   
  }
 
  void updateExplosion(){
 
  }
}