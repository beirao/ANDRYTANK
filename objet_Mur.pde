class Mur{
float XMur;
float YMur;
float LongueurMur;
float HauteurMur;
  
  //constructeur
 Mur(float pXMur, float pYMur, float pLongueurMur, float pHauteurMur){
 XMur = pXMur;
 YMur = pYMur;
 LongueurMur = pLongueurMur;
 HauteurMur = pHauteurMur;
 }
 
 int verifColBordEcranBoulet(float xBoulet,float yBoulet){
  if(xBoulet+(tailleProjectiles/2)>=1500-10||xBoulet-(tailleProjectiles/2)<=10){
    return 3;      //droite et gauche
  }
  else if(yBoulet-(tailleProjectiles/2)<=10||yBoulet+(tailleProjectiles/2)>=900-10){
    return 4;      //haut et bas
  }
  else
    return 5;
}
 
 int verifCollisionBoulet(int i){
     
     xBoulet=bouletL.get(i).XBoulet();
     yBoulet=bouletL.get(i).YBoulet();
     if (tank1.vivant ==true){
     //-----------------------Collision avec tanks----------------------------------
       if(yBoulet+(tailleProjectiles/2)> tank1.positionTankY() && yBoulet-(tailleProjectiles/2)<tank1.positionTankY()+tailleTankY && xBoulet+(tailleProjectiles/2)>tank1.positionTankX() && xBoulet-(tailleProjectiles/2)<tank1.positionTankX()+tailleTankX){
         return 3;
       }
     }
     
     if (tank2.vivant ==true){
        if(yBoulet+(tailleProjectiles/2)> tank2.positionTankY() && yBoulet-(tailleProjectiles/2)<tank2.positionTankY()+tailleTankY && xBoulet+(tailleProjectiles/2)>tank2.positionTankX() && xBoulet-(tailleProjectiles/2)<tank2.positionTankX()+tailleTankX){
         return 4;
       }
     }
     
     if (tank3.vivant ==true){
        if(yBoulet+(tailleProjectiles/2)> tank3.positionTankY() && yBoulet-(tailleProjectiles/2)<tank3.positionTankY()+tailleTankY && xBoulet+(tailleProjectiles/2)>tank3.positionTankX() && xBoulet-(tailleProjectiles/2)<tank3.positionTankX()+tailleTankX){
         return 5;
       }
     }
     if (tank4.vivant ==true){
        if(yBoulet+(tailleProjectiles/2)> tank4.positionTankY() && yBoulet-(tailleProjectiles/2)<tank4.positionTankY()+tailleTankY && xBoulet+(tailleProjectiles/2)>tank4.positionTankX() && xBoulet-(tailleProjectiles/2)<tank4.positionTankX()+tailleTankX){
         return 6;
       }
     }
       //--------------------------Collision avec murs-------------------------------
       if(yBoulet>YMur && yBoulet<YMur+HauteurMur && xBoulet+(tailleProjectiles/2)>XMur && xBoulet-(tailleProjectiles/2)<XMur+LongueurMur)                                
         return 1;          //balle vient de gauche ou de droite
       else if(xBoulet>XMur && xBoulet<XMur+LongueurMur && yBoulet+(tailleProjectiles/2)>YMur && yBoulet-(tailleProjectiles/2)<YMur+HauteurMur)                                
         return 2;          //balle vient du haut ou du bas 
       else
         return 0;

 //    J1bouletL.get(i).update();
   
 }
   
   
 boolean checkCollision(int xTank, int yTank, int tailleX, int tailleY){
  if((xTank>XMur && xTank<XMur+LongueurMur)&&(yTank >YMur && yTank<YMur+HauteurMur))                                 //test bas+droite, test si xTank/yTank est "dans" le mur
     return true;
  if((xTank+tailleX>XMur&& xTank+tailleX<XMur+LongueurMur)&&(yTank >YMur && yTank<YMur+HauteurMur))                  //test test si xTank+TailleTankX/yTank est "dans" le mur
     return true;
  if((xTank+tailleX>XMur&& xTank+tailleX<XMur+LongueurMur)&&(yTank+tailleY >YMur && yTank+tailleY<YMur+HauteurMur))  //test test si xTank+TailleTank/yTank+TailleTankY est "dans" le mur
     return true;
  if((xTank>XMur&& xTank<XMur+LongueurMur)&&(yTank+tailleY >YMur && yTank+tailleY<YMur+HauteurMur))                  //test test si xTank/yTank+TailleTankY est "dans" le mur
     return true;
     
   return false;
 }

void afficher(){
  if(numeroCarte==1){
    imageMode(CORNER);
 //   murForet.resize((int)LongueurMur, (int)HauteurMur);
    image(murForet, XMur, YMur);
  }
  else if(numeroCarte==2){
    rect(XMur,  YMur, LongueurMur, HauteurMur);
}
}
   
 }