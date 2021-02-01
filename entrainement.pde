
void ecranModeEntrainement() {

  zone();
  bougerTankEntrainement();
  bougerCanonEntrainement();
  bougerBouletsEntrainement();
  cible();
  points();
}

void bougerCanonEntrainement() {
  rectMode(CORNER);
  pushMatrix();
  translate(xTank1, hauteurSol - tailleTankYEntrainement);
  rotate(positionCanon1* 0.0174533);
  fill(#7E8134);
  noStroke();
  rect(-6, -4, 45, 10);
  stroke(1);
  popMatrix();
}


void bougerTankEntrainement() {
  if (J1left )                            xTank1 = xTank1 - speedTank;
  if (J1right)                            xTank1 = xTank1 + speedTank;
  if (J1down && (positionCanon1) < 0)     positionCanon1 = positionCanon1 + speedCanon;
  if (J1up && (positionCanon1) > -80)     positionCanon1 = positionCanon1 - speedCanon;


  image(tank, xTank1, hauteurSol - tailleTankYEntrainement/2, tailleTankXEntrainement, tailleTankYEntrainement);   //afficher tank
}



void zone() {

  line(0, hauteurSol, width, hauteurSol); //sol

  //background(150,150,220);
  if (xTank1-30 <0) xTank1 = 30;
  if (xTank1+30 >width/4) xTank1 = width/4-30;
  imageMode(CORNER);
  image(fondTraining, 0, 0);
  imageMode(CENTER);
}  



void points() {   //score et munition, si les balles arrivent a 0 le jeu s'arrete

  fill(0, 102, 153);
  textSize(32);
  text("Score:", 60, 30); 
  text( score, 160, 30);

  fill(0, 102, 153);
  textSize(32);
  text("Balles:", 60, 80); 
  text( balles, 160, 80);
  if (balles==-1) { 

    //fail.play();
    mode=31;
  }
}

void bougerBouletsEntrainement() {  

  noFill();  
  rect(20, 20, 30, 300); //cadre de la barre de puissance

  if (J1tire) {                    //si tu tire
    if (power < 300) {           //si la puissance est < 300
      power = power + 3;          //ajouter +3
      fill(150, 0, 0);                      
      rect(19, 321-power, 30, power);//barre de puissance
      noFill();
    } else {       //sinon
      noStroke();
      fill(0, 220, 0);                //ne plus faire +3
      rect(19, 321-power, 30, power);
      noFill();
      stroke(0);
    }
  } else if (!J1tire && power != 0) {                                                                     // si on lache la touche tirer ça :
    speedProjectile1 = ((power*speedProjectileMax)/300) + speedProjectileMin;                                            //- fait un produit en croix pour convertir le power en speedProjectile
    BouletList.add(new Boulet(xTank1, hauteurSol, tailleTankYEntrainement, speedProjectile1, positionCanon1, grav, rouge1, vert1, bleu1 )); //- ajoute un boulet a la liste
    power=0;     //- fait redescendre la barre de puissance
    balles--;
  }

  for (int i = 0; i < BouletList.size(); i++) {
    BouletList.get(i).update();       //actualiser la position de la balle
    if (BouletList.get(i).edge())      //si colision avec le sol
      BouletList.remove(i);             //enlever le boulet
  }
}

void cible() {

  if (target1.afficherCible==false && target2.afficherCible==false && target3.afficherCible==false && target4.afficherCible==false && target5.afficherCible==false && target6.afficherCible==false) {
    int r= (int) random(6);
    if (r==0)target1.afficherCible=true;

    else if (r==1)  target2.afficherCible=true;

    else if (r==2) target3.afficherCible=true;

    else if (r==3) target4.afficherCible=true;

    else if (r==4) target5.afficherCible=true;

    else if (r==5) target6.afficherCible=true;
  }

  if (target1.afficherCible==true) target1.afficher(); 
  if (target2.afficherCible==true) target2.afficher();
  if (target3.afficherCible==true) target3.afficher(); 
  if (target4.afficherCible==true) target4.afficher(); 
  if (target5.afficherCible==true) target5.afficher(); 
  if (target6.afficherCible==true) target6.afficher(); 




  if (target1.afficherCible==true) {
    for (int i = 0; i < BouletList.size(); i++) {

      if (BouletList.get(i).locationProjectileX() > target1.TargetX- target1.tailleTarget*0.5 && BouletList.get(i).locationProjectileX() < target1.TargetX+ target1.tailleTarget*0.5) {

        if ( BouletList.get(i).locationProjectileY() > target1.TargetY-target1.tailleTarget*0.5 && BouletList.get(i).locationProjectileY() < target1.TargetY+ target1.tailleTarget*0.5) {
          BouletList.remove(i);
          target1.afficherCible=false;
          //point.play();
          score++;
          balles=balles+2;
        }
      }
    }
  }



  if (target2.afficherCible) {
    for (int i = 0; i < BouletList.size(); i++) {     
      if (BouletList.get(i).locationProjectileX() > target2.TargetX- target2.tailleTarget*0.5 && BouletList.get(i).locationProjectileX() < target2.TargetX+ target2.tailleTarget*0.5) {

        if ( BouletList.get(i).locationProjectileY() > target2.TargetY-target2.tailleTarget*0.5 && BouletList.get(i).locationProjectileY() < target2.TargetY+ target2.tailleTarget*0.5) {
          BouletList.remove(i);
          target2.afficherCible=false;
          //point.play();
          score++;
          balles=balles+2;
        }
      }
    }
  }

  if (target3.afficherCible) {
    for (int i = 0; i < BouletList.size(); i++) {     
      if (BouletList.get(i).locationProjectileX() > target3.TargetX- target3.tailleTarget*0.5 && BouletList.get(i).locationProjectileX() < target3.TargetX+ target3.tailleTarget*0.5) {

        if ( BouletList.get(i).locationProjectileY() > target3.TargetY-target3.tailleTarget*0.5 && BouletList.get(i).locationProjectileY() < target3.TargetY+ target3.tailleTarget*0.5) {
          BouletList.remove(i);
          target3.afficherCible=false;
          //point.play();
          score++;
          balles=balles+2;
        }
      }
    }
  }
  if (target4.afficherCible) {
    for (int i = 0; i < BouletList.size(); i++) {     
      if (BouletList.get(i).locationProjectileX() > target4.TargetX- target4.tailleTarget*0.5 && BouletList.get(i).locationProjectileX() < target4.TargetX+ target4.tailleTarget*0.5) {

        if ( BouletList.get(i).locationProjectileY() > target4.TargetY-target4.tailleTarget*0.5 && BouletList.get(i).locationProjectileY() < target4.TargetY+ target4.tailleTarget*0.5) {
          BouletList.remove(i);
          target4.afficherCible=false;
          //point.play();
          score++;
          balles=balles+2;
        }
      }
    }
  }

  if (target5.afficherCible==true) {
    for (int i = 0; i < BouletList.size(); i++) {

      if (BouletList.get(i).locationProjectileX() > target5.TargetX- target5.tailleTarget*0.5 && BouletList.get(i).locationProjectileX() < target5.TargetX+ target5.tailleTarget*0.5) {

        if ( BouletList.get(i).locationProjectileY() > target5.TargetY-target5.tailleTarget*0.5 && BouletList.get(i).locationProjectileY() < target5.TargetY+ target5.tailleTarget*0.5) {
          BouletList.remove(i);
          target5.afficherCible=false;
          //point.play();
          score++;
          balles=balles+2;
        }
      }
    }
  }
  if (target6.afficherCible==true) {
    for (int i = 0; i < BouletList.size(); i++) {

      if (BouletList.get(i).locationProjectileX() > target6.TargetX- target6.tailleTarget*0.5 && BouletList.get(i).locationProjectileX() < target6.TargetX+ target6.tailleTarget*0.5) {

        if ( BouletList.get(i).locationProjectileY() > target6.TargetY-target6.tailleTarget*0.5 && BouletList.get(i).locationProjectileY() < target6.TargetY+ target6.tailleTarget*0.5) {
          BouletList.remove(i);
          target6.afficherCible=false;
          //point.play();
          score++;
          balles=balles+2;
        }
      }
    }
  }
}

void GameOver() {

  fondGameOver();
  textSize(220);
  if (temp<50)
    text("G", 100, 500);

  else if (temp<100)
    text("GA", 100, 500);
  else if (temp<150)
    text("GAM", 100, 500);
  else if (temp<200)
    text("GAME", 100, 500);
  else if (temp<250)
    text("GAME ", 100, 500);
  else if (temp<300)
    text("GAME O", 100, 500);
  else if (temp<350)
    text("GAME OV", 100, 500);
  else if (temp<400)
    text("GAME OVE", 100, 500);
  else 
  text("GAME OVER", 100, 500);
  temp=temp+3;

  buttonGameOver();

  textSize(50);
  text("SCORE:    "+score, width/2, 100);
}


void fondGameOver() {
  int r= (int) random(250);
  int g= (int) random(250);
  int b= (int) random(250); 
  background(r, g, b);
}

void buttonGameOver() {

  image(buttonRestart, 1000, 900, 1100, 800);
  image(buttonMenu, 500, 900, 1100, 800);

  if (mouseX<=650 && mouseX>=300 && mouseY>=600 &&  mouseY<= 720) {
    if ( mousePressed == true&&  mode == 31) {
      mode=0;
      balles=10;
      balles=10;
      score=0;
      BouletList.clear();
      //fail.stop();
      imageMode(CORNER);
    }
  }

  if (mouseX<=1150 && mouseX>=800 && mouseY>=600 &&  mouseY<= 720) {
    if ( mousePressed == true&&  mode == 31) {
      mode=3;
      balles=10;
      score=0;
      BouletList.clear();
      //fail.stop();
    }
  }
}