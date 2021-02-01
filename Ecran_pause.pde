
void ecranPause1D() {
    imageMode(CENTER);
    fill(255);
    image(menuPause, width/2, height/2);
    imageMode(CORNER);

    if (!effetSonore) { 
      image(barre, 878, 390);
    }
    reactivationEffetSonore++;

    if (!musique) { 
      image(barre, 750, 390);
    }
    reactivationMusique++;

    if (mouseX <= 480 && mouseX >= 370 && mouseY <= 505 && mouseY >= 396 && mousePressed) { //recommencer avec les memes tanks

      J2BouletL.clear();      
      J1BouletL.clear();           

      xTank2 = 1400;
      xTank1 = 100;
      positionCanon1 = -50;
      positionCanon2 = 225;
      tailleBarreDeVie1=80;
      tailleBarreDeVie2=80; 
      munition1 = 5; 
      munition2 = 5; 
      power1 = 0;
      power2 = 0;
      randomFond  = (int) random(5);            //selectionne une image de fond aleatoire pour le jeux

      mode = 2;
      pause = false;
    }
    if (mouseX <= 610 && mouseX >= 500 && mouseY <= 505 && mouseY >= 396 && mousePressed) { //recommencer en changeant de tank

      J2BouletL.clear();      
      J1BouletL.clear();           

      xTank2 = 1400;
      xTank1 = 100;
      positionCanon1 = -50;
      positionCanon2 = 225;
      tailleBarreDeVie1=80;
      tailleBarreDeVie2=80; 
      munition1 = 5; 
      munition2 = 5; 
      power1 = 0;
      power2 = 0;
      randomFond  = (int) random(5);            //selectionne une image de fond aleatoire pour le jeux


      mode = 2;
      choixOn = true;
      pause = false;
    }
    if (mouseX <= 738 && mouseX >= 628 && mouseY <= 505 && mouseY >= 396 && mousePressed) { //retourner au menu

      J2BouletL.clear();      
      J1BouletL.clear(); 

      xTank2 = 1400;
      xTank1 = 100;
      positionCanon1 = -50;
      positionCanon2 = 225;
      tailleBarreDeVie1=80;
      tailleBarreDeVie2=80; 
      munition1 = 5; 
      munition2 = 5; 
      power1 = 0;
      power2 = 0;

      mode = 0;
      choixOn = true;
    }
    if (mouseX <= 867 && mouseX >= 757 && mouseY <= 505 && mouseY >= 396 && mousePressed && reactivationMusique >= 30) { //enlever la musique

      if (musique) { 
        musique = false;
        //mAccueil.stop();
        reactivationMusique = 0;
      } else {
        musique = true;
        //mAccueil.loop();
        reactivationMusique = 0;
      }
    }
    if (mouseX <= 996 && mouseX >= 886 && mouseY <= 505 && mouseY >= 396 && mousePressed && reactivationEffetSonore >= 30) { //enlever les effets sonores 

      if (effetSonore) { 
        effetSonore = false;
        reactivationEffetSonore = 0;
      } else {
        effetSonore = true;
        reactivationEffetSonore = 0;
      }
    }
    if (mouseX <= 1128 && mouseX >= 1018 && mouseY <= 505 && mouseY >= 396 && mousePressed || !pause) {//revenir a la partie en cour 
      mode = 2;
      pause = false;
    }
  }
  
  //------------------------------------------------------------------------------------------
  
  
  void ecranPause2D(){
    imageMode(CENTER);
    fill(255);
    image(menuPause, width/2, height/2);
    imageMode(CORNER);

    if (!effetSonore) { 
      image(barre, 878, 390);
    }
    reactivationEffetSonore++;

    if (!musique) { 
      image(barre, 750, 390);
    }
    reactivationMusique++;

    if (mouseX <= 480 && mouseX >= 370 && mouseY <= 505 && mouseY >= 396 && mousePressed) { //recommencer avec les memes tanks

           
      bouletL.clear();
      
      hauteurCurseur=0;
      nbreJoueurs=4;
      compteurExplosion=0;
      nombreTankVivant=nbreJoueurs;
      explosionTank1=false;
      explosionTank2=false;
      explosionTank3=false;
      explosionTank4=false;
      
       //vitesse,angleTank,xTank,yTank,CompteurNbBouletsRestants,vivant
      tank1 = new Tank(3,0,250,250,5,8,true);
      tank2 = new Tank(3,180,1170,580,5,8,true);
      tank3 = new Tank(3,180,1170,250,5,8,true);
      tank4 = new Tank(3,0,250,580,5,8,true);
      

      mode = 1;
      pause = false;
    }
    if (mouseX <= 610 && mouseX >= 500 && mouseY <= 505 && mouseY >= 396 && mousePressed) { //recommencer en changeant de tank
                                                                                           
      bouletL.clear();

      hauteurCurseur=0;
      nbreJoueurs=4;
      compteurExplosion=0;
      nombreTankVivant=nbreJoueurs;
      explosionTank1=false;
      explosionTank2=false;
      explosionTank3=false;
      explosionTank4=false;
      
       //vitesse,angleTank,xTank,yTank,CompteurNbBouletsRestants,vivant
  tank1 = new Tank(3,0,250,250,5,8,true);
  tank2 = new Tank(3,180,1170,580,5,8,true);
  tank3 = new Tank(3,180,1170,250,5,8,true);
  tank4 = new Tank(3,0,250,580,5,8,true);
      
       

      mode = 11;
      pause = false;
     
    }
    if (mouseX <= 738 && mouseX >= 628 && mouseY <= 505 && mouseY >= 396 && mousePressed) { //retourner au menu

      bouletL.clear();
      
      
      hauteurCurseur=0;
      nbreJoueurs=4;
      compteurExplosion=0;
      nombreTankVivant=nbreJoueurs;
      explosionTank1=false;
      explosionTank2=false;
      explosionTank3=false;
      explosionTank4=false;
      
      //vitesse,angleTank,xTank,yTank,CompteurNbBouletsRestants,vivant
      tank1 = new Tank(3,0,250,250,5,8,true);
      tank2 = new Tank(3,180,1170,580,5,8,true);
      tank3 = new Tank(3,180,1170,250,5,8,true);
      tank4 = new Tank(3,0,250,580,5,8,true);
  
      mode = 0;
      choixOn = true;
    }
    if (mouseX <= 867 && mouseX >= 757 && mouseY <= 505 && mouseY >= 396 && mousePressed && reactivationMusique >= 30) { //enlever la musique

      if (musique) { 
        musique = false;
        //mAccueil.stop();
        reactivationMusique = 0;
      } else {
        musique = true;
        //mAccueil.loop();
        reactivationMusique = 0;
      }
    }
    if (mouseX <= 996 && mouseX >= 886 && mouseY <= 505 && mouseY >= 396 && mousePressed && reactivationEffetSonore >= 30) { //enlever les effets sonores 

      if (effetSonore) { 
        effetSonore = false;
        reactivationEffetSonore = 0;
      } else {
        effetSonore = true;
        reactivationEffetSonore = 0;
      }
    }
    if (mouseX <= 1128 && mouseX >= 1018 && mouseY <= 505 && mouseY >= 396 && mousePressed || !pause) {//revenir a la partie en cour 
      mode = 1;
      pause = false;
    }
  }