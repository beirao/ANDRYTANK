
void ecranMode1D(){
  if(choixOn)
    ecranChoixTanks();
  
  else{
    switch(randomFond) {                                 //afficher un fond aleatoire
     case 0: background(imageFond1);           break;    
     case 1: background(imageFond2);           break;    
     case 2: background(imageFond3);           break;   
     case 3: background(imageFond4);           break;  
     case 4: background(imageFond1);           break;
     case 5: background(imageFond4);           break;  
    }
  
    
    //ID 1 : tank classique
    //ID 2 : tank artilleur
    //ID 3 : tank ninja
    
    //IDtank1 = 3;
    //IDtank2 = 3;
    
    if(IDtank1 == 1){ speedTank1 = 2; speedCanon1 = 1   ; vieTank1 = 200; incrementPower1 = 3; tailleTankX1 = 70 ; tailleTankY1 = 55;  }
    if(IDtank2 == 1){ speedTank2 = 2; speedCanon2 = 1   ; vieTank2 = 200; incrementPower2 = 3; tailleTankX2 = 70 ; tailleTankY2 = 55;  }
    
    if(IDtank1 == 2){ speedTank1 = 1; speedCanon1 = 0.75; vieTank1 = 300; incrementPower1 = 3; tailleTankX1 = 110; tailleTankY1 = 50;  } 
    if(IDtank2 == 2){ speedTank2 = 1; speedCanon2 = 0.75; vieTank2 = 300; incrementPower2 = 3; tailleTankX2 = 110; tailleTankY2 = 50;  }
     
    if(IDtank1 == 3){ speedTank1 = 3; speedCanon1 = 1.25; vieTank1 = 100; incrementPower1 = 3; tailleTankX1 = 80 ; tailleTankY1 = 50;  } 
    if(IDtank2 == 3){ speedTank2 = 3; speedCanon2 = 1.25; vieTank2 = 100; incrementPower2 = 3; tailleTankX2 = 80 ; tailleTankY2 = 50;  }
    
    bougerBoulets();
    afficherCanon();
    afficherTank();
    bougerTank();
    vieTank();
    fx();
    munition();
    
    if(pause) { 
      fill(0,100);
      rect(0,0,width,height);
      mode = 5; 
    }
    
    ecranFinDePartie();
  }
}

void ecranChoixTanks(){
  background(fondChoix);
  image(ecranChoix,0,0);
  
  if(J1tire) 
    tankChoisi1 = true;
  if(J2tire)
    tankChoisi2 = true;
    
  if(!tankChoisi1){
    if(J1down) compteurChoix1 = compteurChoix1 + 1;
    if(compteurChoix1 == 3) compteurChoix1 = 0;
  }
  if(!tankChoisi2){
    if(J1up) compteurChoix1 = compteurChoix1 - 1;
    if(compteurChoix1 == -1) compteurChoix1 = 2;
  }
  delay(100);
  
  noFill();
  if(!tankChoisi1)
    stroke(39,7,188);
  else
    stroke(#EDE42B);
  strokeWeight(5);
  
  if(compteurChoix1 == 0){
    rect(35,175,247,118);
    IDtank1 = 1;
  }
  if(compteurChoix1 == 1){
    rect(35,310,247,118);
    IDtank1 = 2;
  }
  if(compteurChoix1 == 2){
    rect(35,445,247,118);
    IDtank1 = 3;
  }
  
  
  if(J2down) compteurChoix2 = compteurChoix2 - 1;
  if(compteurChoix2 == 3) compteurChoix2 = 0;
  
  if(J2up) compteurChoix2 = compteurChoix2 + 1;
  if(compteurChoix2 == -1) compteurChoix2 = 2;
  
  noFill();
  if(!tankChoisi2)
    stroke(176,0,0);
  else
    stroke(#EDE42B);  
  strokeWeight(5);
  
  if(compteurChoix2 == 0){
    IDtank2 = 1;
    rect(932,175,247,118);
  }
  if(compteurChoix2 == 1){
    rect(932,310,247,118);
    IDtank2 = 2;
  }
  if(compteurChoix2 == 2){
    rect(932,445,247,118);
    IDtank2 = 3;
  }

  if(tankChoisi1 && tankChoisi2){
    choixOn = false;
    pause = false;
    tankChoisi1 = false;
    tankChoisi2 = false;
  }
  strokeWeight(1);
  stroke(0);
}


void afficherTank(){
  imageMode(CENTER);
  if(IDtank1 == 3) image(tankNinjaBleu, xTank1, hauteurSol - tailleTankY1/2+1);       //afficher tank 1 ninja 
  if(IDtank2 == 3) image(tankNinjaRouge, xTank2, hauteurSol - tailleTankY2/2 -5);   //afficher tank 2 ninja  
  
  if(IDtank1 == 1) image(tankClassiqueBleu, xTank1, hauteurSol - tailleTankY1/2+10);       //afficher tank 1 classique 
  if(IDtank2 == 1) image(tankClassiqueRouge, xTank2, hauteurSol - tailleTankY2/2 +6);   //afficher tank 2 classique
  
  if(IDtank1 == 2) image(tankArtilleurBleu, xTank1, hauteurSol - tailleTankY1/2 + 6);       //afficher tank 1 artilleur 
  if(IDtank2 == 2) image(tankArtilleurRouge, xTank2, hauteurSol - tailleTankY2/2 + 8);   //afficher tank 2 artilleur  
  
  
}
void afficherCanon(){
  imageMode(CORNER);
  
  pushMatrix();
  
  if(IDtank1 == 1){ 
    translate(xTank1 , hauteurSol - tailleTankY1+5 );   
    rotate(positionCanon1* 0.0174533); 
    image(canonClassique,0,0);   
  }
  if(IDtank1 == 2){ 
    translate(xTank1  , hauteurSol - tailleTankY1  );  
    rotate(positionCanon1* 0.0174533); 
    image(canonArtilleur,0,0);   
  }
  if(IDtank1 == 3){ 
    translate(xTank1 +2, hauteurSol - tailleTankY1 +4);
    rotate(positionCanon1* 0.0174533);
    image(canonNinja,0,0);  
  }
  
  popMatrix();
  
  pushMatrix();
  
  if(IDtank2 == 1){ 
   translate(xTank2 -5 , hauteurSol - tailleTankY2 +13);   
    rotate(positionCanon2* 0.0174533); 
    image(canonClassique,0,0);   
  }
  if(IDtank2 == 2){ 
    translate(xTank2  , hauteurSol - tailleTankY2 +13);  
    rotate(positionCanon2* 0.0174533); 
    image(canonArtilleur,0,0);   
  }
  if(IDtank2 == 3){ 
    translate(xTank2 -5 , hauteurSol - tailleTankY2 +12);
    rotate(positionCanon2* 0.0174533);
    image(canonNinja,0,0);  
  }
  
  popMatrix();
  
}

void munition(){
 
  switch(munition1) {  //affiche chargeur en fonction en fonction des munitions 
   case 1: fill(#FF0303);  rect(70,30,119,50);           image(obus,48,28);                                                                                            break;    
   case 2: fill(#EDA024);  rect(70,30,119,50);           image(obus,48,28);  image(obus,72,28);                                                                        break;   
   case 3: fill(#EAE421);  rect(70,30,119,50);           image(obus,48,28);  image(obus,72,28);  image(obus,96,28);                                                    break;  
   case 4: fill(#C1EA21);  rect(70,30,119,50);           image(obus,48,28);  image(obus,72,28);  image(obus,96,28);  image(obus,120,28);                               break;
   case 5: fill(#71F705);  rect(70,30,119,50);           image(obus,48,28);  image(obus,72,28);  image(obus,96,28);  image(obus,120,28);  image(obus,144,28);          break;  
  }
  
  switch(munition2) {  //affiche chargeur en fonction en fonction des munitions 
   case 1: fill(#FF0303);  rect(width-189,30,119,50);    image(obus,width-211,28);                                                                                                                      break;    
   case 2: fill(#EDA024);  rect(width-189,30,119,50);    image(obus,width-211,28);  image(obus,width-187,28);                                                                                           break;   
   case 3: fill(#EAE421);  rect(width-189,30,119,50);    image(obus,width-211,28);  image(obus,width-187,28);  image(obus,width-163,28);                                                                break;  
   case 4: fill(#C1EA21);  rect(width-189,30,119,50);    image(obus,width-211,28);  image(obus,width-187,28);  image(obus,width-163,28);  image(obus,width-139,28);                                     break;
   case 5: fill(#71F705);  rect(width-189,30,119,50);    image(obus,width-211,28);  image(obus,width-187,28);  image(obus,width-163,28);  image(obus,width-139,28);  image(obus,width-115,28);          break;  
  }
  
  
  if(munition1==0 && compteurMunition1 >= tempsRechargement){   //si plus de balle et que le temps de recharge est ecoulé 
    munition1 = 5;                                                //recharge 5 munition
    compteurMunition1 =0;                                         //compter de la recharge reset
  }
  if(munition1==0) {                                            //si plus de munition
    compteurMunition1++;                                         //incremente le compteur 
    fill(#FF0303);
    rect(70,30,119,50);                                          //affiche le cadre de la barre de rechargement 
    fill(#71F705);
    rechargement1 = (compteurMunition1*119)/tempsRechargement;   //produit en croix adaptant le temps de rechargement voulu et le pixel de la barre 
    rect(70,30,rechargement1,50);                                //affiche la barre de rechargement 
  }
  
  if(munition2==0 && compteurMunition2 >= tempsRechargement){  //si plus de balle et que le temps de recharge est ecoulé 
    munition2 = 5;                                                //recharge 5 munition 
    compteurMunition2 =0;                                         //compter de la recharge reset
  }
  if(munition2==0) {                                            //si plus de munition
    compteurMunition2++;                                         //incremente le compteur 
    fill(#FF0303);
    rect(width-189,30,119,50);                                   //affiche le cadre de la barre de rechargement
    fill(#71F705);
    rechargement2 = (compteurMunition2*119)/tempsRechargement;   //produit en croix adaptant le temps de rechargement voulu et le pixel de la barre
    rect(width-189,30,rechargement2,50);                         //affiche la barre de rechargement 
  }
}


void fx(){
  if(explosion1){                          //si explosion 
    image(explosion1D, xTank2 -90, 660 );      //afficher l'explosion
    compteurExplosion1++;                    //incrementer le conteur permetant l'affichage de l'explosion durant un certain temps
  }
  if(compteurExplosion1 >30){             //si le compteur depasse 30 
     explosion1 = false;                    //ne plus afficher l'explosion 
     compteurExplosion1 =0;                 //le compteur passe a 0
  }

  if(explosion2){                         //si explosion 
    image(explosion1D, xTank1 - 90, 660 );    //afficher l'explosion
    compteurExplosion2++;                   //incrementer le conteur permetant l'affichage de l'explosion durant un certain temps
  }
  if(compteurExplosion2 >30){             //si le compteur depasse 30 
     explosion2 = false;                    //afficher l'explosion  
     compteurExplosion2 =0;                 //incrementer le conteur permetant l'affichage de l'explosion durant un certain temps
  }  
}

  
void bougerTank(){   
  imageMode(CORNER);
  
  if(!win){
    if(J1left && xTank1 > 0 + (tailleTankX1/2))       xTank1 = xTank1 - speedTank1;
    if(J1right && xTank1 < width - (tailleTankX1/2))  xTank1 = xTank1 + speedTank1;
    if(J1down && (positionCanon1) < 0)                positionCanon1 = positionCanon1 + speedCanon1;
    if(J1up && (positionCanon1) > -80)                positionCanon1 = positionCanon1 - speedCanon1;
   
    if(J2left && xTank2 > 0 + (tailleTankX2/2))       xTank2 = xTank2 - speedTank2;
    if(J2right && xTank2 < width - (tailleTankX2/2))  xTank2 = xTank2 + speedTank2;
    if(J2down && (positionCanon2) < 260)              positionCanon2 = positionCanon2 + speedCanon2;
    if(J2up && (positionCanon2) > 180)                positionCanon2 = positionCanon2 - speedCanon2;
  }
}  


void vieTank(){
  noFill();
  rect(xTank2-40,hauteurSol - 120,80,10); //cadre de la barre de vie 
  
   for (int i = 0 ; i < J1BouletL.size() ; i++){ //hitbox du tank 2
    if(J1BouletL.get(i).locationProjectileX() > xTank2-(tailleTankX2-20) && J1BouletL.get(i).locationProjectileX() < xTank2+(tailleTankX2-20) && J1BouletL.get(i).locationProjectileY() > hauteurSol - (tailleTankY2+tailleProjectile1D)){
      J1BouletL.remove(i); //si un boulet rencontre le tank il disparait
      explosion1 = true;   //si collision le boolean explosion passe vrai
      if(effetSonore && !win )
        //mExplosion.play();   //effet sonore explosion
      
      if(tailleBarreDeVie2 > 0 && !win){              //si la vie et au-dessus de de 0 
          degatPixel2 = (80/vieTank2)*degatProjectile;               //produit en croix qui fait le rapport de proportionnalité entre les degats et les pixels a retirer
          tailleBarreDeVie2 = tailleBarreDeVie2 - degatPixel2;       //enlever 10 a la vie
         
          fill(125);
      }
    }
  }
   
  fill(#5DDB28);
  rect(80-tailleBarreDeVie2 + xTank2-40,hauteurSol - 120,tailleBarreDeVie2,10); //barre de vie  
  noFill();
  rect(xTank1-40,hauteurSol - 120,80,10);  //cadre de la barre de vie 
  
  for (int i = 0 ; i < J2BouletL.size() ; i++){ //hitbox du tank 1
    if(J2BouletL.get(i).locationProjectileX() > xTank1-(tailleTankX1-20) && J2BouletL.get(i).locationProjectileX() < xTank1+(tailleTankX1-20) && J2BouletL.get(i).locationProjectileY() > hauteurSol - (tailleTankY1+tailleProjectile1D)){
      J2BouletL.remove(i); //si un boulet rencontre le tank il disparait
      explosion2 = true;   //si collision le boolean explosion passe vrai
      if(effetSonore && !win) 
        //mExplosion.play();   //effet sonore explosion

      
      if(tailleBarreDeVie1 > 0 && !win){                      //si la vie et au-dessus de de 0   
          degatPixel1 = (80/vieTank1)*degatProjectile;               //produit en croix qui fait le rapport de proportionnalité entre les degats et les pixels a retirer
          tailleBarreDeVie1 = tailleBarreDeVie1 - degatPixel1;       //enlever 10 a la vie
          fill(125);
      }
    } 
  }
   fill(#5DDB28);
   rect(80-tailleBarreDeVie1 + xTank1-40,hauteurSol - 120,tailleBarreDeVie1,10); //barre de vie
   noFill();
}



void bougerBoulets(){   
  
  noFill();  
  rect(20,20,30,300); //cadre de la barre de puissance
   if(munition1 != 0 && !win){             //si plus de munition alors ne tire pas
     if(J1tire){                    //si tu tire
        if(power1 < 300){           //si la puissance est < 300
          power1 = power1 + incrementPower1;          //ajouter +3
          fill(#CE1515);                       
          rect(19,321-power1,30,power1);//barre de puissance
          noFill();
      }
      else{                        //sinon          
        fill(#CE1515);                //ne plus faire +3
        rect(19,321-power1,30,power1); 
        noFill();
      }
    }
    else if(!J1tire && power1 != 0){                                                                                     // si on lache la touche tirer ça :
      speedProjectile1 = ((power1*speedProjectileMax)/300) + speedProjectileMin;                                                    //- fait un produit en croix pour convertir le power en speedProjectile
      J1BouletL.add(new Boulet(xTank1, hauteurSol, tailleTankY1, speedProjectile1, positionCanon1, grav ,rouge1 , vert1 , bleu1)); //- ajoute un boulet a la liste
      power1=0;                                                                                                                     //- fait redescendre la barre de puissance
      munition1--;                                                                                                                  //- moins une balle dans le chargeur de munition
    }
   }
  
  for (int i = 0 ; i < J1BouletL.size() ; i++){
    J1BouletL.get(i).update();  //actualiser la position de la balle
    if(J1BouletL.get(i).edge()) //si colision avec le sol
      J1BouletL.remove(i);      //enlever le boulet
  }
   
   noFill();  
   rect(width-50,20,30,300); //cadre de la barre de puissance
  if(munition2 != 0 && !win){            //si plus de munition alors ne tire pas
    if(J2tire){                     //si tu tire
        if(power2 < 300){           //si la puissance est < 300
        power2 = power2 + incrementPower2;          //ajouter +3
        fill(#CE1515);                       
        rect(width-49,321-power2,30,power2);//barre de puissance
        noFill();
      }
      else{                        //sinon          
        fill(#CE1515);                   //ne plus faire +3
        rect(width-49,321-power2,30,power2); 
        noFill();
      }
    }
    else if(!J2tire && power2 != 0) {                                                                                     // si on lache la touche tirer ça :
      speedProjectile2 = ((power2*speedProjectileMax)/300) + speedProjectileMin;                                                   //- fait un produit en croix pour convertir le power en speedProjectile
      J2BouletL.add(new Boulet(xTank2, hauteurSol, tailleTankY2, speedProjectile2, positionCanon2, grav ,rouge2 ,vert2 , bleu2 )); //- ajouter un boulet a la liste
      power2=0;                                                                                                                    //- fait redescendre la barre de puissance
      munition2--;                                                                                                                 //- moins une balle dans le chargeur de munition
    }
  }
  for (int i = 0 ; i < J2BouletL.size() ; i++){
    J2BouletL.get(i).update();       //actualiser la position de la balle
    if(J2BouletL.get(i).edge())      //si colision avec le sol
      J2BouletL.remove(i);           //enlever le boulet
  }

}


//-------------------------------------- ecranFinDePartie() -----------------------------------------

void ecranFinDePartie(){
  
  
  if(tailleBarreDeVie1 >= 0 && tailleBarreDeVie2 >= 0){
    win = false;
  }
  
  if(tailleBarreDeVie1 <= 0){
    xTank1 = xTank1 -5;
    
    if(xTank2 < width / 2 -10) 
      xTank2 = xTank2 +3;
    else if(xTank2 > width / 2 +10)
      xTank2 = xTank2 -3;
    else 
      xTank2 = width / 2;
      
    positionCanon2 = positionCanon2 + 12;
    J2BouletL.add(new Boulet(xTank2, hauteurSol, tailleTankY2, speedProjectile2, positionCanon2, grav ,rouge2 ,vert2 , bleu2 ));
    speedProjectile2 = 12;
    win = true;
    
    imageMode(CENTER);
    image(finDeJeu, width/2, 170);
    imageMode(CORNER);
    
    
    
  if (mouseX <= 678 && mouseX >= 568 && mouseY <= 227 && mouseY >= 118 && mousePressed) { //recommencer avec les memes tanks
  
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
  if (mouseX <= 806 && mouseX >= 696 && mouseY <= 227 && mouseY >= 118 && mousePressed) { //recommencer en changeant de tank
  
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
  if  (mouseX <= 934 && mouseX >= 824 && mouseY <= 227 && mouseY >= 118 && mousePressed) { //retourner au menu
  
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
  }
    
    fill(255,0,0);
    textSize(45);
    text("Le joueur Rouge a gagné", 510,350);
    
  }
  
  else if(tailleBarreDeVie2 <= 0){
    xTank2 = xTank2 +5;
    
    if(xTank1 < width / 2 -10) 
      xTank1 = xTank1 +3;
    else if(xTank1 > width / 2 +10) 
      xTank1 = xTank1 -3;
    else 
      xTank1 = width / 2;
      
    positionCanon1 = positionCanon1 + 12;
    J1BouletL.add(new Boulet(xTank1, hauteurSol, tailleTankY1, speedProjectile1, positionCanon1, grav, rouge1 ,vert1 , bleu1 ));
    speedProjectile1 = 12;
    win = true;
    
    imageMode(CENTER);
    image(finDeJeu, width/2, 170);
    imageMode(CORNER);
    
    
  if (mouseX <= 678 && mouseX >= 568 && mouseY <= 227 && mouseY >= 118 && mousePressed) { //recommencer avec les memes tanks
  
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
  if (mouseX <= 806 && mouseX >= 696 && mouseY <= 227 && mouseY >= 118 && mousePressed) { //recommencer en changeant de tank
  
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
  if  (mouseX <= 934 && mouseX >= 824 && mouseY <= 227 && mouseY >= 118 && mousePressed) { //retourner au menu
  
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
  }
    
    fill(0,0,255);
    textSize(45);
    text("Le joueur Bleu a gagné", 510,350);
    
  }
}