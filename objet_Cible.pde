
class Target {
  int tailleTarget=75;
  int TargetX, TargetY, Speed, posinitialX, posinitialY;
  int limite, mode;
  boolean afficherCible=false;


  //constructor: il va prendre des variables en paramètre et les assigner à l'objet :

  Target( int tempTargetX, int tempTargetY, int tempSpeed, int tempLimite, int tempMode) {
    posinitialX=tempTargetX;
    posinitialY=tempTargetY;
    TargetX=tempTargetX;
    TargetY=tempTargetY;
    Speed=tempSpeed;
    limite=tempLimite;
    mode=tempMode;
  }



  //on appelle cette fonction avec target.afficher() N OUBLIE PAS LE POINT MONIR
  void afficher() {


    if (mode==1) {         //si le cest le mode 1 la cible bouge horizontalement

      if (TargetX>=limite+posinitialX) Speed= Speed*-1;
      else if (TargetX<=posinitialX-limite) Speed= Speed*-1;

      TargetX=TargetX+Speed;
      fill(255);  
      ellipse(TargetX, TargetY, tailleTarget, tailleTarget);  
      fill(250, 0, 0);  
      ellipse(TargetX, TargetY, tailleTarget*0.50, tailleTarget*0.50);
    } else if (mode==2) {           //si le cest le mode 1 la cible bouge verticalement

      if (TargetY>=posinitialY+limite) Speed= Speed*-1;
      else if (TargetY<=posinitialY-limite) Speed= Speed*-1;


      TargetY=TargetY+Speed;
      fill(255);  
      ellipse(TargetX, TargetY, tailleTarget, tailleTarget);  
      fill(250, 0, 0);  
      ellipse(TargetX, TargetY, tailleTarget*0.50, tailleTarget*0.50);
    }
  }
}