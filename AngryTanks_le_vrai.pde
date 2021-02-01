
//-------------------------------------- gestion des touches du clavier ---------------------------------------

  void keyPressed() {
     switch(keyCode){

       case 80 : if(!pause) { 
                   pause = true;
                   break;
                 }
                 else {
                   pause = false; 
                   break;
                 } 
                               
     case ENTER :  J2tire = true;touche_entree=true; break;
     case UP : Bup = true; J2down = true; break;
     case DOWN : Bdown = true;J2up = true; break;
     case RIGHT : Bright = true;J2right = true; break;
     case LEFT : Bleft = true; J2left = true; break;
     case 90 : touche_z = true; J1up = true;break;
     case 83 : touche_s  = true; J1down = true;break;
     case 81 : touche_q  = true; J1left = true; break;
     case 68 : touche_d = true; J1right = true; break;
     case 79 : touche_o = true; break;
     case 75 : touche_k = true; break;
     case 76 : touche_l = true; break;
     case 77 : touche_m = true; break;
     case 32 : touche_espace = true; J1tire = true; break;
     
     case 87 : touche_w = true; break;
     case 88 : touche_x  = true; break;
     case 67 : touche_c  = true; break;
     case 86 : touche_v = true; break;
     case 66 : touche_b = true; break;
     case 78 : touche_n = true; break;
     case 82 : touche_r = true; break;
     case 84 : touche_t = true; break;
     case 89 : touche_y = true; break;
     case 85 : touche_u = true; break;
     
     case 65 : touche_a = true; break;
     case 69 : touche_e  = true; break;
     
     
     case 48 : touche_0 = true; break;
     case 49 : touche_1 = true; break;
     case 50 : touche_2 = true; break;
     case 51 : touche_3 = true; break;
     case 52 : touche_4 = true; break;
     case 53 : touche_5 = true; break;
     case 54 : touche_6 = true; break;
     case 55 : touche_7 = true; break;
     case 56 : touche_8 = true; break;
     case 57 : touche_9 = true; break;
     }
  }
     
  void keyReleased(){
    switch(keyCode){
     case ENTER :  J2tire = false;touche_entree=false; break;
     case UP : Bup = false; J2down = false; break;
     case DOWN : Bdown = false;J2up = false; break;
     case RIGHT : Bright = false;J2right = false; break;
     case LEFT : Bleft = false; J2left = false; break;
     case 90 : touche_z = false; J1up = false;break;
     case 83 : touche_s  = false; J1down = false;break;
     case 81 : touche_q  = false; J1left = false; break;
     case 68 : touche_d = false; J1right = false; break;
     case 79 : touche_o = false; break;
     case 75 : touche_k = false; break;
     case 76 : touche_l = false; break;
     case 77 : touche_m = false; break;
     case 32 : touche_espace = false; J1tire = false; break;
     
     case 87 : touche_w = false; break;
     case 88 : touche_x  = false; break;
     case 67 : touche_c  = false; break;
     case 86 : touche_v = false; break;
     case 66 : touche_b = false; break;
     case 78 : touche_n = false; break;
     case 82 : touche_r = false; break;
     case 84 : touche_t = false; break;
     case 89 : touche_y = false; break;
     case 85 : touche_u = false; break;
     
     case 65 : touche_a = false; break;
     case 69 : touche_e  = false; break;
     
     
     case 48 : touche_0 = false; break;
     case 49 : touche_1 = false; break;
     case 50 : touche_2 = false; break;
     case 51 : touche_3 = false; break;
     case 52 : touche_4 = false; break;
     case 53 : touche_5 = false; break;
     case 54 : touche_6 = false; break;
     case 55 : touche_7 = false; break;
     case 56 : touche_8 = false; break;
     case 57 : touche_9 = false; break;
    }
  }
  

//-------------------------------------- Traitement ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void setup() {
  size(1500,900);
  frameRate(120); 
  smooth();
  mode=0;

  
  target1 = new Target(1000,500,2,50,1);        //initialisation des cibles avec ses caracteristiques
  target2 = new Target(1200,250,3,80,1);
  target3 = new Target(1400,450,1,250,2);
  target4 = new Target(750,250,5,500,1);
  target5 = new Target(750,100,10,100,1);
  target6 = new Target(1200,500,4,70,2);
  
  explosion = new ExplosionObject();
  
  //vitesse,angleTank,xTank,yTank,CompteurNbBouletsRestants,vivant
  tank1 = new Tank(3,0,250,250,5,8,true);
  tank2 = new Tank(3,180,1170,580,5,8,true);
  tank3 = new Tank(3,180,1170,250,5,8,true);
  tank4 = new Tank(3,0,250,580,5,8,true);
  
  murL.add( new Mur(1500/9, 900/9.6, 1500/5.6, 900/16));
  murL.add( new Mur(largeurEcran/9, hauteurEcran/2.2, largeurEcran/5.6, hauteurEcran/16));
  murL.add( new Mur(largeurEcran/9, hauteurEcran/1.2, largeurEcran/5.6, hauteurEcran/16));
  murL.add( new Mur(largeurEcran/1.4, hauteurEcran/9.6, largeurEcran/5.6, hauteurEcran/16));
  murL.add( new Mur(largeurEcran/1.4, hauteurEcran/2.2, largeurEcran/5.6, hauteurEcran/16));
  murL.add( new Mur(largeurEcran/1.4, hauteurEcran/1.2, largeurEcran/5.6, hauteurEcran/16));
  murL.add( new Mur(largeurEcran/2.8, hauteurEcran/3.4, largeurEcran/3.4, hauteurEcran/16));
  murL.add( new Mur(largeurEcran/2.8, hauteurEcran/1.55, largeurEcran/3.4, hauteurEcran/16));
  
  
  buttonMenu = loadImage("image/images mode entrainement/buttonMenu.png");
  buttonRestart = loadImage("image/images mode entrainement/buttonRestart.png");
  
  imageFond1 = loadImage("image/image fond/image fond1.jpg"); imageFond1.resize(width, height);
  imageFond2 = loadImage("image/image fond/image fond2.png"); imageFond2.resize(width, height);
  imageFond3 = loadImage("image/image fond/image fond3.png"); imageFond3.resize(width, height);
  imageFond4 = loadImage("image/image fond/image fond4.png"); imageFond4.resize(width, height);
  imageFond5 = loadImage("image/image fond/image fond5.png"); imageFond5.resize(width, height);
  imageFond6 = loadImage("image/image fond/image fond6.jpg"); imageFond6.resize(width, height);
  
  solobutton= loadImage("image/image ecrant accueil/solobutton.png");
  multibutton= loadImage("image/image ecrant accueil/multibutton.png");
  creditsbutton= loadImage("image/image ecrant accueil/creditsbutton.png");
  setupbutton= loadImage("image/image ecrant accueil/setupbutton.png");
  title=loadImage("image/image ecrant accueil/title.png");
  fond=loadImage("image/image ecrant accueil/fond.jpg");                  fond.resize(width, height);
  explosion1D=loadImage("image/effet/explosion.png");                     explosion1D.resize(200, 100);
  obus = loadImage("image/divers 1D/obus.png");                           obus.resize(70,60);
  boutonSon = loadImage("image/image ecrant accueil/bouton son.png");     boutonSon.resize(250,100);

  
  canonClassique = loadImage("image/skin tank/canon classique.png");
  tankClassiqueBleu = loadImage("image/skin tank/tank bleu classique.png");
  tankClassiqueRouge = loadImage("image/skin tank/tank rouge classique.png");
  
  canonArtilleur = loadImage("image/skin tank/canon artilleur.png");
  tankArtilleurBleu = loadImage("image/skin tank/tank bleu artilleur.png");
  tankArtilleurRouge = loadImage("image/skin tank/tank rouge artilleur.png");
  
  canonNinja = loadImage("image/skin tank/canon ninja.png");
  tankNinjaBleu = loadImage("image/skin tank/tank bleu ninja.png");
  tankNinjaRouge = loadImage("image/skin tank/tank rouge ninja.png");
 
 
  photoCredit = loadImage("image/credit/photo credit.png");
  fondCredit = loadImage("image/credit/fond credit.png");
  boutonRetour = loadImage("image/credit/bouton retour.png");             boutonRetour.resize(110,110);
  boutonRetourActive = loadImage("image/credit/bouton retour activé.png");boutonRetourActive.resize(110,110);
  menuPause = loadImage("image/pause/pause.png");
  barre = loadImage("image/pause/barre.png");                             barre.resize(130,130);
  barre1 = loadImage("image/pause/barre.png");    
  
  finDeJeu = loadImage("image/divers 1D/fin de jeu.png");
  ecranChoix = loadImage("image/divers 1D/ecran choix.png");
  fondChoix = loadImage("image/divers 1D/fond choix.jpg");               fondChoix.resize(width,height);
  
  tank = loadImage("image/images mode entrainement/tank.png");
  fondTraining = loadImage("image/images mode entrainement/fond.png");
  
  bouletYann=loadImage("image/divers 2D/bouletYann.png");                bouletYann.resize(tailleProjectiles,tailleProjectiles);
  FondYann=loadImage("image/divers 2D/FondYann.png");                    FondYann.resize(1500,900);
  Fond2Yann=loadImage("image/divers 2D/Fond2Yann.png");                  Fond2Yann.resize(1500,900);
  FondForetYann=loadImage("image/divers 2D/FondForetYann.png");          FondForetYann.resize(1500,900);
  murForet=loadImage("image/divers 2D/murForet.png");                    

  fondEcranChoix=loadImage("image/divers 2D/fondEcranChoix.jpg");        fondEcranChoix.resize(1500,900);

  touchesZQSD=loadImage("image/divers 2D/touchesZQSD.png");              touchesZQSD.resize(200,160);
  toucheESPACE=loadImage("image/divers 2D/toucheESPACE.png");            toucheESPACE.resize(350,60);
  
  cadreJeu=loadImage("image/divers 2D/cadreJeu.png");                    cadreJeu.resize(1504,903);
   
  skinTank1Yann=loadImage("image/skin tank 2D/skinTank1Yann.png");       skinTank1Yann.resize(tailleTankX+15,tailleTankY+15);
  skinTank2Yann=loadImage("image/skin tank 2D/skinTank2Yann.png");       skinTank2Yann.resize(tailleTankX+15,tailleTankY+15);
  skinTank3Yann=loadImage("image/skin tank 2D/skinTank3Yann.png");       skinTank3Yann.resize(tailleTankX+15,tailleTankY+15);
  skinTank4Yann=loadImage("image/skin tank 2D/skinTank4Yann.png");       skinTank4Yann.resize(tailleTankX+15,tailleTankY+15);
  
  skinCanon1Yann=loadImage("image/skin tank 2D/skinCanon1Yann.png");     skinCanon1Yann.resize(tailleTankX-10,tailleTankY-19);
  skinCanon2Yann=loadImage("image/skin tank 2D/skinCanon2Yann.png");     skinCanon2Yann.resize(tailleTankX-10,tailleTankY-19);
  skinCanon3Yann=loadImage("image/skin tank 2D/skinCanon3Yann.png");     skinCanon3Yann.resize(tailleTankX-10,tailleTankY-19);
  skinCanon4Yann=loadImage("image/skin tank 2D/skinCanon4Yann.png");     skinCanon4Yann.resize(tailleTankX-10,tailleTankY-19);
       
  uncoeursYann=loadImage("image/coeurs 2D/uncoeursYann.png");            uncoeursYann.resize(50, 23);
  deuxcoeursYann=loadImage("image/coeurs 2D/deuxcoeursYann.png");        deuxcoeursYann.resize(50, 23);
  troiscoeursYann=loadImage("image/coeurs 2D/troiscoeursYann.png");      troiscoeursYann.resize(80, 22);
  quatrecoeursYann=loadImage("image/coeurs 2D/quatrecoeursYann.png");    quatrecoeursYann.resize(100, 20);
  cinqcoeursYann=loadImage("image/coeurs 2D/cinqcoeursYann.png");        cinqcoeursYann.resize(120, 20);
 
  
  //mExplosion = new SoundFile(this, "son/explosion son.wav");
  //mAccueil = new SoundFile(this, "son/AngryTank.wav");
  //mAccueil.loop();

}

void draw() {
  if(mode==1 || mode == 11) frameRate(60);
  else                      frameRate(120);
  
  switch(mode) {
   case 0: ecranAccueil();          break;    
   case 1: ecranMode2D();           break;  
   case 11 : ecranChoix();          break;
   case 2: ecranMode1D();           break;   
   case 3: ecranModeEntrainement(); break; 
   case 31: GameOver();             break;
   case 4: ecranCredit();           break;
   case 5: ecranPause1D();          break;  
   case 6: ecranPause2D();          break;
   
  }
}