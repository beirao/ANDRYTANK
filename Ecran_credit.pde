
void ecranCredit() {
  imageMode(CENTER);
  

  pushMatrix();
  translate(width/2, height/2);   
  rotate(millis() * 0.001 * TWO_PI / 100.0); 
  image(fondCredit, 1, 1, 2000, 1800);  
  popMatrix();

  image(boutonRetour, 70, height -70);

  if (mouseX<= 120 && mouseX>=20 && mouseY<height-20 && mouseY>=height - 120) {
    image(boutonRetourActive, 70, height -70);
    if (mousePressed) mode = 0;
  }

  image(photoCredit, width/2, 500, 1000, 800);
  imageMode(CORNER);

  noStroke();
  fill(0, 125);
  rect(30, 23, 1220, 210);

  fill(255);
  textSize(35);
  text("par Yann Bernard, Thomas MARQUES et Monir HINDA", 50, 60);
  textSize(25);
  text("Musique AngryTanks® par Thomas MARQUES", 80, 100); 
  text("Skin Tank par Thomas MARQUES", 80, 140);
  text("Map de jeu par Wallpaper Abyss", 80, 180);
  text("Menu design par Monir HINDA", 80, 220);

  stroke(1);
}