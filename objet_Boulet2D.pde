class BouletYann{
  
  PVector locationProjectile,vitesseProjectile ; 
  int nbRebonds;
  
    public BouletYann( float xTank1 , float yTank1 , float vitesseProjectiles , float angleT1 ,int nombreRebond ){
      locationProjectile = new PVector(xTank1+60*cos((angleT1)* 0.0174533), yTank1+60*sin((angleT1)* 0.0174533));
      vitesseProjectile = new PVector((vitesseProjectiles*cos((angleT1)* 0.0174533)),(vitesseProjectiles*sin((angleT1)* 0.0174533)));
      nbRebonds = nombreRebond;
      
    }
    
    void update(){
        locationProjectile.add(vitesseProjectile);
        image(bouletYann,locationProjectile.x,locationProjectile.y);
    }
    
    boolean changementSensGD(){
      if(nbRebonds>0){
         
         vitesseProjectile.x= vitesseProjectile.x * -1;
         nbRebonds--;
         return true;
      }
      else return false;
    }
    
     boolean changementSensHB(){
      if(nbRebonds>0){
        vitesseProjectile.y= vitesseProjectile.y * -1;
        nbRebonds--;
        return true;
         
      }
      else return false;
    }
    
    
    float XBoulet(){
        return locationProjectile.x;
    }
     float YBoulet(){
        return locationProjectile.y;
    }
}