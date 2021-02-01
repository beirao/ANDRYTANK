
void ecranAccueil(){             //Mode 0
  
  pause = false;
  
  background(fond);  //afficher l'image de fond
  image(cadreJeu,-1,-1);
  afficherbouton();
  afficherBoutonSon();
  image(title,width/2 -200,70,400,300);    //afficher le logo du jeu
}

void afficherBoutonSon(){
  image(boutonSon,width - 250, 20);
  
  if(!effetSonore){ 
    image(barre1,1345,10);
   }
   reactivationEffetSonore++;
   
  if(!musique){ 
    image(barre1,1237,10);
   }
   reactivationMusique++;
  
   if (mouseX <=1350  && mouseX >= 1260 && mouseY <= 110 && mouseY >= 20 && mousePressed && reactivationMusique >= 30) { //enlever la musique
  
     if(musique){ 
       musique = false;
       //mAccueil.stop();
       reactivationMusique = 0;
     }
     else{
       musique = true;
       //mAccueil.loop();
       reactivationMusique = 0;
     }
  }
  if (mouseX <= 1457 && mouseX >= 1367 && mouseY <= 110 && mouseY >= 20 && mousePressed && reactivationEffetSonore >= 30) { //enlever les effets sonores 
     
     if(effetSonore){ 
       effetSonore = false;
       reactivationEffetSonore = 0;
     }
     else{
       effetSonore = true;
       reactivationEffetSonore = 0;
     }
  }
}
void afficherbouton(){

  if (mouseX<=width/4+175 && mouseX>=width/4-175 && mouseY<=400+130 && mouseY>=400) { //si on passe le curseur sur un bouton 
    solobutton.resize(363, 176);                                                        //il s'agrandit
    image(solobutton, width/4-181, 400);                                                //afficher le bouton agrandit
    if (mousePressed == true &&  mode == 0) {    //si on appuie sur le bouton 
      mode=2;                                      //passe au mode 1
    }
  } else {                                    //sinon
      solobutton.resize(330, 160);              //le bouton a sa taille normale
      image(solobutton, width/4-181, 400);      //afficher le bouton a sa taille normale
      solobutton= loadImage("image/image ecrant accueil/solobutton.png");        //charger l'image a chaque fois pour eviter quelle devienne flou 
  }
 
  //=============================================
  if (mouseX<=2.8*width/4+175 && mouseX>=2.8*width/4-175 && mouseY<=400+130 && mouseY>=400 ) {
    multibutton.resize(363, 176);
    image(multibutton, 2.8*width/4 -100, 400);  
    if ( mousePressed == true &&  mode == 0) {
      randomFond  = (int) random(5);            //selectionne une image de fond aleatoire pour le jeux
      mode=11;
    }
  } else {
    multibutton.resize(330, 160);
    image(multibutton, 2.8*width/4 - 100, 400);
    multibutton= loadImage("image/image ecrant accueil/multibutton.png");
  }
 
  //============================================
  if (mouseX<=width/4+175 && mouseX>=width/4-175 && mouseY<=680+130 && mouseY>=680) {
    setupbutton.resize(363, 176);
    image(setupbutton, width/4-181, 680);
    if ( mousePressed == true &&  mode == 0) {
      mode=3;
    }
  } else {
    setupbutton.resize(330, 160);
    image(setupbutton, width/4-181, 680);
    setupbutton= loadImage("image/image ecrant accueil/setupbutton.png");
  }
 
  //======================================
  if (mouseX<=2.8*width/4+175 && mouseX>=2.8*width/4-175 && mouseY<=680+130 && mouseY>=680) {
    creditsbutton.resize(363, 176);
    image(creditsbutton, 2.8*width/4-100, 680);
    if ( mousePressed == true &&  mode == 0) {
      mode=4;
    }
  } else {
    creditsbutton.resize(330, 160);
    image(creditsbutton, 2.8*width/4-100, 680);
    creditsbutton= loadImage("image/image ecrant accueil/creditsbutton.png");
  }
}