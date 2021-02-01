
class Boulet {
  PVector locationProjectile, vitesseProjectile, accelerationProjectile ; 
  int rouge, vert, bleu;

  public Boulet( int xTank, int hauteurSol, int tailleTankY, float speedProjectile, float positionCanon, float grav, int rouge, int vert, int bleu) {       //le const        ructeur de l'objet 
    locationProjectile = new PVector(xTank, hauteurSol - tailleTankY+5);                                                                                           //la position initial 
    vitesseProjectile = new PVector((speedProjectile*cos((positionCanon)* 0.0174533)), (speedProjectile*sin((positionCanon)* 0.0174533)));                           //la vitesse initial decomposé sur les 2 axes
    accelerationProjectile = new PVector(0, grav);                                                                                                                   //la force de gravité et la seul acceleration que subit chaque boulet
    this.rouge  =rouge;
    this.vert = vert;
    this.bleu = bleu;
  }

  public void update() {
    vitesseProjectile.add(accelerationProjectile);                // ajoute la acceleration a la vitesse
    locationProjectile.add(vitesseProjectile);                    // ajoute la vitesse a la position

    fill(rouge, vert, bleu);        
    ellipse(locationProjectile.x, locationProjectile.y, tailleProjectile1D, tailleProjectile1D);  //afficher le boulet 
    fill(255);
  }


  float locationProjectileX() {  //fonction nécessaire au colision avec le tank enemi
    return locationProjectile.x;  //pour connaitre la position de chaque balle en x
  }
  float locationProjectileY() { //fonction nécessaire au colision avec le tank enemi
    return locationProjectile.y;  //pour connaitre la position de chaque balle en y
  }

  boolean edge() {                                                  //fonction qui gère les collisitions avec le sol 
    if (locationProjectile.y > hauteurSol-tailleProjectile1D) {      //si collision fait disparaitre le boulet
      return true;
    }
    return false;
  }
}