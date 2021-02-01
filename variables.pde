
//import processing.sound.*; 
//ControlP5 cp5;

PImage uncoeursYann, deuxcoeursYann, troiscoeursYann, quatrecoeursYann, cinqcoeursYann;
PImage skinTank1Yann, skinTank2Yann, skinTank3Yann, skinTank4Yann;
PImage skinCanon1Yann, skinCanon2Yann, skinCanon3Yann, skinCanon4Yann;
PImage FondYann, Fond2Yann, FondForetYann, fondEcranChoix, murForet, bouletYann, touchesZQSD, toucheESPACE,cadreJeu;

PImage imageFond1, imageFond2, imageFond3, imageFond4, imageFond5, imageFond6, imageFond7;
PImage solobutton, multibutton, creditsbutton, setupbutton, title, fond, explosion1D, obus;
PImage canonClassique, tankClassiqueBleu, tankClassiqueRouge, canonArtilleur, tankArtilleurBleu, tankArtilleurRouge, canonNinja, tankNinjaBleu, tankNinjaRouge; 
PImage photoCredit, fondCredit, boutonRetour, menuPause, barre, barre1, boutonRetourActive, boutonSon, finDeJeu, ecranChoix,fondChoix;
PImage tank,fondTraining, buttonMenu, buttonRestart;

//SoundFile mAccueil, mExplosion, point,fail;

int mode;

PVector canonTank;
PVector centerTank;
ArrayList<Boulet> J1BouletL = new ArrayList();
ArrayList<Boulet> J2BouletL = new ArrayList();

boolean J1up = false; 
boolean J1down = false;
boolean J1right = false;
boolean J1left = false;
boolean J1tire = false;

boolean J2up = false; 
boolean J2down = false;
boolean J2right = false;
boolean J2left = false;
boolean J2tire = false;

boolean pause;
boolean effetSonore = true;
boolean musique = true;
boolean win = false;
boolean choixOn = true;

boolean tankChoisi1 = false;
boolean tankChoisi2 = false;

boolean explosion1 = false;
boolean explosion2 = false;
int compteurExplosion1, compteurExplosion2;

int munition1 = 5; 
int munition2 = 5; 
int compteurMunition1,compteurMunition2, rechargement1, rechargement2;
int compteurChoix1, compteurChoix2;
int reactivationEffetSonore = 45;
int reactivationMusique = 45;
int tempsRechargement = 250;

int rouge1 = 0;
int vert1 = 0;
int bleu1 = 255;

int rouge2 = 255;
int vert2 = 0;
int bleu2 = 0;

int xTank2 = 1400;
int xTank1 = 100;
float positionCanon1 = -50;
float positionCanon2 = 225;
float tailleBarreDeVie1=80;
float tailleBarreDeVie2=80;

float degatPixel1 = 0;
float degatPixel2 = 0;
int power1 = 0;
int power2 = 0;
int power = 0;

int compteurPause;
int randomFond;
int degatProjectile = 10;
float speedProjectile1, speedProjectile2;
float speedProjectileMax = 10;
float speedProjectileMin = 5;
int tailleProjectile1D = 10;
int hauteurSol = 750;
float grav = 0.1;

int balles=10;
int score=0;
ArrayList<Boulet> BouletList = new ArrayList();
int temp =0;
int speedTank = 2;
int tailleTankXEntrainement = 140;
int tailleTankYEntrainement = 80;

Target target1,target2,target3,target4,target5,target6;
Mur mur1, mur2, mur3, mur4, mur5, mur6, mur7, mur8;
Tank tank1,tank2,tank3,tank4;

int IDtank1, IDtank2;

int speedTank1 = 2; 
int speedTank2 = 2; 
float speedCanon1 = 1;
float speedCanon2 = 1;
int speedCanon = 1;
int tailleTankX1 = 60;
int tailleTankX2 = 60;
int tailleTankY1 = 30;
int tailleTankY2 = 30;
float vieTank1=300;
float vieTank2=300;
int incrementPower1 = 3;
int incrementPower2 = 3;

//Variables Tank 
int tailleTankX = 73;
int tailleTankY = 45;

//Variables Projectiles
int tailleProjectiles = 17;
float vitesseProjectiles = 0.125;
int CompteurEcartTir;

float xBoulet;
float yBoulet;
boolean vivant;
int nombreRebond=2;

int hauteurCurseur=0;
int nbreJoueurs=4;
int compteurEcartTemps;
int numeroCarte=2;
int compteurExplosion=0;
int nombreTankVivant=nbreJoueurs;

boolean explosionTank1=false;
boolean explosionTank2=false;
boolean explosionTank3=false;
boolean explosionTank4=false;


int largeurEcran=1500;
int hauteurEcran=900;

ArrayList<BouletYann> bouletL = new ArrayList();
ArrayList<Mur> murL = new ArrayList();


boolean Bup = false;
boolean Bdown = false;
boolean Bright = false;
boolean Bleft = false;

boolean touche_z = false;
boolean touche_q = false;
boolean touche_s = false;
boolean touche_d = false;
boolean touche_o = false;
boolean touche_k = false;
boolean touche_l = false;
boolean touche_m = false;
boolean touche_espace = false;

boolean touche_w = false;
boolean touche_x = false;
boolean touche_c = false;
boolean touche_v = false;
boolean touche_b = false;
boolean touche_n = false;
boolean touche_r = false;
boolean touche_t = false;
boolean touche_y = false;
boolean touche_u = false;

boolean touche_a = false;
boolean touche_e = false;
boolean touche_p = false;

boolean touche_0 = false;
boolean touche_1 = false;
boolean touche_2 = false;
boolean touche_3 = false;
boolean touche_4 = false;
boolean touche_5 = false;
boolean touche_6 = false;
boolean touche_7 = false;
boolean touche_8 = false;
boolean touche_9 = false;
boolean touche_entree = false;