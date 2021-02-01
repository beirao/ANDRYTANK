class Tank{
 int vitesse;
 float angleTank;
 float xTank;
 float yTank;
 int nombreVie;
 boolean vivant;
 int CompteurNbBouletsRestants;
  //constructeur
 public Tank(int pvitesse, int pangleTank, int pxTank, int pyTank, int pnombreVie, int pCompteurNbBouletsRestants,  boolean pvivant){
   vitesse = pvitesse;
   angleTank = pangleTank;
   xTank = pxTank;
   yTank = pyTank;
   nombreVie = pnombreVie;
   vivant = pvivant;
   CompteurNbBouletsRestants = pCompteurNbBouletsRestants;
 }
 
 void afficher(){

//-----------------------------Affichage tanks et canons----------------------------------
  if(tank1.vivant==true){
    imageMode(CORNER);
     image(skinTank1Yann,tank1.xTank-6,tank1.yTank-6);
     
     pushMatrix();
     imageMode(CENTER);
     translate(tank1.xTank+(tailleTankX/2), tank1.yTank+(tailleTankY/2)+1.5);    //point d'origine du canon
     rotate(tank1.angleTank* 0.0174533);
     image(skinCanon1Yann,10,0);
     popMatrix();
      
  }
     
   if(tank2.vivant==true){
     imageMode(CORNER);
     image(skinTank2Yann,tank2.xTank-6,tank2.yTank-6);
     
     pushMatrix();
     imageMode(CENTER);
     translate(tank2.xTank+(tailleTankX/2), tank2.yTank+(tailleTankY/2)+1.5);    //point d'origine du canon
     rotate(tank2.angleTank* 0.0174533);
     image(skinCanon2Yann,10,0);
     popMatrix();
   }
     
   if(tank3.vivant==true){ 
     imageMode(CORNER);
     image(skinTank3Yann,tank3.xTank-6,tank3.yTank-6);
     
     pushMatrix();
     imageMode(CENTER);
     translate(tank3.xTank+(tailleTankX/2), tank3.yTank+(tailleTankY/2)+1.5);    //point d'origine du canon
     rotate(tank3.angleTank* 0.0174533);
     image(skinCanon3Yann,10,0);
     popMatrix();
   }
     
   if(tank4.vivant==true){
     imageMode(CORNER);
     image(skinTank4Yann,tank4.xTank-6,tank4.yTank-6);
    
     pushMatrix();
     imageMode(CENTER);
     translate(tank4.xTank+(tailleTankX/2), tank4.yTank+(tailleTankY/2)+1.5);    //point d'origine du canon
     rotate(tank4.angleTank* 0.0174533);
     image(skinCanon4Yann,10,0);
     popMatrix();
   }
//------------------------------------------Affichage explosions------------------------
   if (explosionTank1==true){
     if(compteurExplosion<100){
       pushMatrix();
        translate(tank1.xTank+(tailleTankX/2),tank1.yTank+(tailleTankY/2));
        explosion.afficherExplosion();
       popMatrix();
       compteurExplosion++;
     }
     else {
     explosionTank1=false;
     compteurExplosion=0;
     }
   }
   
   if (explosionTank2==true){
     if(compteurExplosion<100){
       pushMatrix();
        translate(tank2.xTank+(tailleTankX/2),tank2.yTank+(tailleTankY/2));
        explosion.afficherExplosion();
       popMatrix();
       compteurExplosion++;
     }
     else {
     explosionTank2=false;
     compteurExplosion=0;
     }
   }
   
   if (explosionTank3==true){
     if(compteurExplosion<100){
       pushMatrix();
        translate(tank3.xTank+(tailleTankX/2),tank3.yTank+(tailleTankY/2));
        explosion.afficherExplosion();
       popMatrix();
       compteurExplosion++;
     }
     else {
     explosionTank3=false;
     compteurExplosion=0;
     }
   }
   
   if (explosionTank4==true){
     if(compteurExplosion<100){
       pushMatrix();
        translate(tank4.xTank+(tailleTankX/2),tank4.yTank+(tailleTankY/2));
        explosion.afficherExplosion();
       popMatrix();
       compteurExplosion++;
     }
     else {
     explosionTank4=false;
     compteurExplosion=0;
     }
   }
//------------------------------------------------------------------------------------
}


void afficherVies(){
  if(vivant==true){
   imageMode(CENTER);
   
   if(nombreVie>=6){
     image(uncoeursYann,xTank+(10*tailleTankX/11),yTank-20);
     stroke(0);
     strokeWeight(200);
     fill(255,0,0);
     textSize(30);
     text(nombreVie,xTank,yTank-10);
   }
   if(nombreVie<=-2){
     image(uncoeursYann,xTank+(10*tailleTankX/11),yTank-20);
     stroke(0);
     strokeWeight(200);
     fill(255,0,0);
     textSize(30);
     text("∞",xTank+10,yTank-10);
   }
   
   else if(nombreVie==5)
     image(cinqcoeursYann,xTank+(tailleTankX/2),yTank-20);
     
   else if(nombreVie==4)
     image(quatrecoeursYann,xTank+(tailleTankX/2),yTank-20);
     
   else if(nombreVie==3)
     image(troiscoeursYann,xTank+(tailleTankX/2),yTank-20);
     
   else if(nombreVie==2)
     image(deuxcoeursYann,xTank+(tailleTankX/2),yTank-20);
     
   else if(nombreVie==1)
     image(uncoeursYann,xTank+(5*tailleTankX/7),yTank-20);
     
   else if(nombreVie==0){
     vivant=false;
    
      if (tank1.nombreVie==0){
        nombreTankVivant--;
        tank1.nombreVie--;
        explosionTank1=true;
      }
      else if (tank2.nombreVie==0){
        nombreTankVivant--;
        tank2.nombreVie--;
        explosionTank2=true;
      }
      else if (tank3.nombreVie==0){
        nombreTankVivant--;
        tank3.nombreVie--;
        explosionTank3=true;
      }
      else if (tank4.nombreVie==0){
        nombreTankVivant--;
        tank4.nombreVie--;
        explosionTank4=true;
      }
    
   }
   else if(nombreVie <= -2){//mode vie infinie
     
   }
  }
 } 

//-------------------------------------------------------------------------------------------- 
 
 boolean verifColBordEcran(int viX,int viY){
  
   for(Mur m : murL){
     if(m.checkCollision((int) xTank+viX,  (int)yTank+viY, tailleTankX, tailleTankY))
       return false;
      }  
     if((int) xTank+tailleTankX+viX>=width-10||(int) xTank+viX<=10||(int) yTank+viY<=10||(int) yTank+tailleTankY+viY>=height-10){
       return false;
     }
     else{
       return true;
   }
  
}
void bougerBoulet(boolean toucheTir){
  if(vivant==true){
    if(nombreTankVivant==2 || nombreTankVivant==1) CompteurEcartTir-=2;
    else CompteurEcartTir-=1;
       
      
       if(toucheTir && CompteurEcartTir<0 ){ //&& CompteurNbBouletsRestants>0
          bouletL.add(new BouletYann(xTank+(tailleTankX/2), yTank+(tailleTankY/2), vitesseProjectiles, angleTank, nombreRebond));
          CompteurEcartTir=50;
          CompteurNbBouletsRestants-=1;
       } 
       
       
       
       for(Mur m : murL){                                                      //Pour chaque mur...
         for (int i = 0; i < bouletL.size(); i++){                           //Puis pour chaque Boulet...
             
              if(m.verifCollisionBoulet(i)==1 || m.verifColBordEcranBoulet(xBoulet, yBoulet)==3){  //Test de collision avec mur
                  if(bouletL.get(i).changementSensGD()){
                    bouletL.get(i).update();
                    bouletL.get(i).update();
                    bouletL.get(i).update();
                    bouletL.get(i).update();
                  }
                  else{
                    bouletL.remove(i);
                    CompteurNbBouletsRestants+=1;
                  }
               }
              else if(m.verifCollisionBoulet(i)==2 || m.verifColBordEcranBoulet(xBoulet, yBoulet)==4){  //Test de collision avec mur
                  if(bouletL.get(i).changementSensHB()){
                    bouletL.get(i).update();
                    bouletL.get(i).update();
                    bouletL.get(i).update();
                    bouletL.get(i).update();
                  }
                  else {
                    bouletL.remove(i);
                    CompteurNbBouletsRestants+=1;
                  }
               }
               
             else if(m.verifCollisionBoulet(i)==3){
               bouletL.remove(i);
               CompteurNbBouletsRestants+=1;
               tank1.nombreVie = tank1.nombreVie-1;
               //vie en moins pour le J1
             }
             else if(m.verifCollisionBoulet(i)==4){
               bouletL.remove(i);
               CompteurNbBouletsRestants+=1;
               //vie en moins pour le J2
               tank2.nombreVie = tank2.nombreVie-1;
             }
             else if(m.verifCollisionBoulet(i)==5){
               bouletL.remove(i);
               CompteurNbBouletsRestants+=1;
               //vie en moins pour le J3
               tank3.nombreVie = tank3.nombreVie-1;
             }
             else if(m.verifCollisionBoulet(i)==6){
               bouletL.remove(i);
               CompteurNbBouletsRestants+=1;
               //vie en moins pour le J4
               tank4.nombreVie = tank4.nombreVie-1;
             }
             else if(m.verifCollisionBoulet(i)==0 && m.verifColBordEcranBoulet(xBoulet, yBoulet)==5){
               
                if(nombreTankVivant==4){
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                }
                else if (nombreTankVivant==3){
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                }
                else if (nombreTankVivant==2){
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                }
                else if (nombreTankVivant==1){
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                  bouletL.get(i).update();
                }
                  
                
             }
         }
     }
 }
}
 
void bougerTank(boolean touche_z,boolean touche_q,boolean touche_s,boolean touche_d){
  if(vivant==true){
   if(touche_z&&verifColBordEcran(0,-vitesse)){
      yTank -= vitesse;
    }
    if(touche_q&&verifColBordEcran(-vitesse,0)){
      xTank -= vitesse;
    }
    if(touche_s&&verifColBordEcran(0,vitesse)){
      yTank += vitesse;
    }
    if(touche_d&&verifColBordEcran(vitesse,0)){
      xTank += vitesse;
    }
  }
}


void bougerCanon(boolean touche_o, boolean touche_k, boolean touche_l, boolean touche_m){      //Attention comme le repere est inversé le sens trigo est aussi inversé
  if(vivant==true){

   float angle1TourTank= angleTank % 360;                                                                         //Fonctionne en degrés
   
   if (touche_o && touche_m  && angle1TourTank!=315 && ((angle1TourTank>135 && angle1TourTank<315) || (angle1TourTank<-45 && angle1TourTank>-225)))               //Haut-Droite
        angleTank+=2;
        
   else if (touche_o && touche_m  && ((angle1TourTank>-45 && angle1TourTank<135) || angle1TourTank<-225 || angle1TourTank>315))                                   //Haut-Droite
        angleTank-=2;
   
   else if (touche_k && touche_l  && ((angle1TourTank>135 && angle1TourTank<315) || (angle1TourTank<-45 && angle1TourTank>-285)))                                 //Bas-Gauche
        angleTank-=2;
        
   else if (touche_k && touche_l  && ((angle1TourTank>-45 && angle1TourTank<135) || angle1TourTank<-225 || angle1TourTank>315))                                   //Bas-Gauche
        angleTank+=2;                        
              
   else if (touche_o && touche_k  && angle1TourTank!=225 && ((angle1TourTank>45 && angle1TourTank<225) || (angle1TourTank<-135 && angle1TourTank>-315)))          //Haut-Gauche
        angleTank+=2;
        
   else if (touche_o && touche_k  && ((angle1TourTank>-135 && angle1TourTank<45) || angle1TourTank<-315 || angle1TourTank>225))                                   //Haut-Gauche
        angleTank-=2;
        
   else if (touche_m && touche_l  && angle1TourTank!=225 && ((angle1TourTank>45 && angle1TourTank<225) || (angle1TourTank<-135 && angle1TourTank>-315)))          //Bas-Droite
        angleTank-=2;
        
   else if (touche_m && touche_l  && ((angle1TourTank>-135 && angle1TourTank<45) || angle1TourTank<-315 || angle1TourTank>225))                                   //Bas-Droite
        angleTank+=2;
   
   
    
   else if (touche_o && !touche_m && !touche_k && angle1TourTank!=270 && ((angle1TourTank>90 && angle1TourTank<=270) || (angle1TourTank<-90 && angle1TourTank>=-270)))   //Haut
    angleTank+=2;
   
   else if (touche_o && !touche_m && !touche_k && ((angle1TourTank<90 && angle1TourTank>-90) || angle1TourTank<-270 || angle1TourTank>270))                              //Haut
    angleTank-=2;
   
   else if (touche_l && !touche_k && !touche_m && angle1TourTank!=90 && ((angle1TourTank>90 && angle1TourTank<=270) || (angle1TourTank<=-90 && angle1TourTank>-270)))    //Bas
    angleTank-=2;
   
   else if (touche_l && !touche_k && !touche_m && ((angle1TourTank<90 && angle1TourTank>-90) || angle1TourTank<-270 || angle1TourTank>270))                              //Bas
    angleTank+=2;
    
   else if (touche_m && !touche_o && !touche_l && ((angle1TourTank>0 && angle1TourTank<180) || (angle1TourTank<-180 && angle1TourTank>-360)))                            //Droite
    angleTank-=2;
   
   else if (touche_m && !touche_o && !touche_l && angle1TourTank!=0 &&((angle1TourTank>180 && angle1TourTank<360 ) || (angle1TourTank<0 && angle1TourTank>-180)))     //Droite
    angleTank+=2;
     
   else if (touche_k && !touche_l && !touche_o && ((angle1TourTank>180 && angle1TourTank<360 ) || (angle1TourTank<0 && angle1TourTank>-180 )))                          //Gauche
    angleTank-=2;
     
   else if (touche_k && !touche_l && !touche_o && angle1TourTank!=180 &&((angle1TourTank>0 && angle1TourTank<180) || (angle1TourTank<-180 )))                            //Gauche
    angleTank+=2;
  }
}



 
float positionTankX(){
 return xTank; 
}

float positionTankY(){
 return yTank; 
}

/* 
void bougerCanon(){
  if(touche_o)   angleT1 -= 5;
  if(touche_l)   angleT1 += 5;  
}
*/

}