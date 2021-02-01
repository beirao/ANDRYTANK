

  


void ecranChoix(){    //Mode 11
  background(fondEcranChoix);
  image(cadreJeu,-1,-1);
  ecranChoixBoutons();
  deplacementEntreBoutons();
}

void ecranMode2D(){          //Mode 1

 if (numeroCarte==1) background(FondForetYann);
 else if (numeroCarte==2) background(Fond2Yann);

  if(pause) { 
    fill(0,100);
    rect(0,0,width,height);
    mode = 6; 
  }  
  
  
  tank1.bougerTank(touche_z,touche_q,touche_s,touche_d);
  tank2.bougerTank(touche_0,touche_1,touche_2,touche_3);
  tank3.bougerTank(touche_8,touche_9,touche_w,touche_x);
  tank4.bougerTank(touche_r,touche_t,touche_y,touche_u);
  
  tank1.bougerCanon(touche_o, touche_k, touche_l, touche_m);
  tank2.bougerCanon(touche_4, touche_5, touche_6, touche_7);
  tank3.bougerCanon(touche_c, touche_v, touche_b, touche_n);
  tank4.bougerCanon(Bup, Bleft, Bdown, Bright);
  
  tank1.bougerBoulet(touche_espace);
  tank2.bougerBoulet(touche_a);
  tank3.bougerBoulet(touche_e);
  tank4.bougerBoulet(touche_p);
  
  affichage();
  if(tank1.vivant &&! tank2.vivant && !tank3.vivant && !tank4.vivant) pause=true;
  else if(!tank1.vivant && tank2.vivant && !tank3.vivant && !tank4.vivant) pause=true;
  else if(!tank1.vivant &&! tank2.vivant && tank3.vivant && !tank4.vivant) pause=true;
  else if(!tank1.vivant &&! tank2.vivant && !tank3.vivant && tank4.vivant) pause=true;
  
}



//-------------------------------------------------------Differentes fonctions--------------------------------------------
 //<>// //<>// //<>// //<>//

void affichage(){
  
      fill(255);
      stroke(40);
      strokeWeight(3);
      for(Mur m : murL)
       m.afficher();
  
      tank1.afficher();
      tank2.afficher();
      tank3.afficher();
      tank4.afficher();
      
      tank1.afficherVies();
      tank2.afficherVies();
      tank3.afficherVies();
      tank4.afficherVies();
      
      image(cadreJeu,751,451);
}

//------------------------------------------Ecran transition-------------------------------------------
void ecranChoixBoutons() {
  rectMode(CORNER);
  textMode(CORNER);
  textSize(40);
  stroke(255);
  if (hauteurCurseur==0) fill(80);
  else fill(0);
  rect(400, 160, 700, 80);

  fill(0);
  triangle(380, 160, 380, 240, 300, 200);
  triangle(1120, 160, 1120, 240, 1200, 200);

  fill(255);
  text("Nombre de joueurs : " + nbreJoueurs, 450, 210);

  //------------------------------------------------------on décale tous les y de 140
  if (hauteurCurseur==1) fill(80);
  else fill(0);
  rect(400, 300, 700, 80);
  fill(10);
  triangle(380, 300, 380, 380, 300, 340);
  triangle(1120, 300, 1120, 380, 1200, 340);

  fill(255);
  if(tank1.nombreVie==-2) text("Nombre de vies : ∞" , 450, 350);
  else                    text("Nombre de vies : " + tank1.nombreVie, 450, 350);
  

  //------------------------------------------------------on décale encore tous les y de 140

  if (hauteurCurseur==2) fill(80);
  else fill(0);
  rect(400, 440, 700, 80);

  fill(0);
  triangle(380, 440, 380, 520, 300, 480);
  triangle(1120, 440, 1120, 520, 1200, 480);

  fill(255);
  
  if(nombreRebond==2000000) text("Nombre de rebonds : ∞" , 450, 490);
  else                      text("Nombre de rebonds : " + nombreRebond, 450, 490);
  
/*  //------------------------------------------------------on décale encore tous les y de 140

  if (hauteurCurseur==3) fill(80);
  else fill(0);
  rect(400, 580, 700, 80);

  fill(0);
  triangle(380, 580, 380, 660, 300, 620);
  triangle(1120, 580, 1120, 660, 1200, 620);

  fill(255);
  
  
  text("Fond d'écran : " + numeroCarte, 450, 630);
  
  
*/
  //------------------------------------------------------Bouton jouer
  if (hauteurCurseur==3) fill(80);
  else fill(0);

  rect(500, 700, 500, 110);
  fill(255);
  textSize(85);
  text("JOUER", 630, 780);
  
  //--------------------------------------------------------
  image(touchesZQSD,80,665);
  
  image(toucheESPACE,10,830);
}

void deplacementEntreBoutons() {

  compteurEcartTemps--;

  if (compteurEcartTemps < 0) {  

    if (touche_s  && hauteurCurseur<3) hauteurCurseur++;
    else if (touche_z && hauteurCurseur>0) hauteurCurseur--;


    else if (touche_q && hauteurCurseur == 0 && nbreJoueurs > 2) nbreJoueurs--; 
    else if (touche_d && hauteurCurseur == 0 && nbreJoueurs < 4) nbreJoueurs++;


    else if (touche_q && hauteurCurseur == 1 && tank1.nombreVie>1 && tank1.nombreVie<= 10) {
      tank1.nombreVie--; 
      tank2.nombreVie--; 
      tank3.nombreVie--; 
      tank4.nombreVie--;
    } 
    else if (touche_d && hauteurCurseur == 1 && tank1.nombreVie<10 && tank1.nombreVie>0) { 
      tank1.nombreVie++; 
      tank2.nombreVie++; 
      tank3.nombreVie++; 
      tank4.nombreVie++;
    } 
    else if (touche_d && hauteurCurseur == 1 && tank1.nombreVie<50 && tank1.nombreVie>=10) { 
      tank1.nombreVie=tank1.nombreVie+5; 
      tank2.nombreVie=tank2.nombreVie+5; 
      tank3.nombreVie=tank3.nombreVie+5; 
      tank4.nombreVie=tank4.nombreVie+5;
    } 
    else if (touche_q && hauteurCurseur == 1 && tank1.nombreVie<=50 && tank1.nombreVie>10) { 
      tank1.nombreVie=tank1.nombreVie-5; 
      tank2.nombreVie=tank2.nombreVie-5; 
      tank3.nombreVie=tank3.nombreVie-5; 
      tank4.nombreVie=tank4.nombreVie-5;
    } 
    else if (touche_d && hauteurCurseur == 1 && tank1.nombreVie==50) { 
      tank1.nombreVie=-2; 
      tank2.nombreVie=-2; 
      tank3.nombreVie=-2; 
      tank4.nombreVie=-2;
    } 
    else if (touche_q && hauteurCurseur == 1 && tank1.nombreVie==-2) { 
      tank1.nombreVie=50; 
      tank2.nombreVie=50; 
      tank3.nombreVie=50; 
      tank4.nombreVie=50;
    } 
//-------------------------------------------------------------------
   
    
     else if (touche_q && hauteurCurseur == 2 && nombreRebond>0 && nombreRebond<= 10) {
      nombreRebond--; 
     
    } 
    else if (touche_d && hauteurCurseur == 2 && nombreRebond<10 && nombreRebond>=0) { 
      nombreRebond++; 
   
    } 
    else if (touche_d && hauteurCurseur == 2 && nombreRebond<50 && nombreRebond>=10) { 
      nombreRebond=nombreRebond+5; 
   
    } 
    else if (touche_q && hauteurCurseur == 2 && nombreRebond<=50 && nombreRebond>10) { 
      nombreRebond=nombreRebond-5; 

    } 
    else if (touche_d && hauteurCurseur == 2 && nombreRebond==50) nombreRebond=2000000; 
    else if (touche_q && hauteurCurseur == 2 && nombreRebond==2000000) nombreRebond=50; 

//    else if (touche_q && hauteurCurseur == 3 && numeroCarte > 1) numeroCarte--; 
//   else if (touche_d && hauteurCurseur == 3 && numeroCarte < 2) numeroCarte++;
    

    else if (touche_espace && hauteurCurseur == 3 ) {
      if (nbreJoueurs==1) {
        tank1.vivant = true;
        tank2.vivant = false;
        tank3.vivant = false;
        tank4.vivant = false;
      } else if (nbreJoueurs==2) {
        tank1.vivant = true;
        tank2.vivant = true;
        tank3.vivant = false;
        tank4.vivant = false;
      } else if (nbreJoueurs==3) {
        tank1.vivant = true;
        tank2.vivant = true;
        tank3.vivant = true;
        tank4.vivant = false;
      } else if (nbreJoueurs==4) {
        tank1.vivant = true;
        tank2.vivant = true;
        tank3.vivant = true;
        tank4.vivant = true;
      }
      nombreTankVivant=nbreJoueurs;
      delay(300);
      mode = 1;
    }
    compteurEcartTemps=7;
  }
}