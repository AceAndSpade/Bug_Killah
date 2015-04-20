//import de.ilu.movingletters.*;
import ddf.minim.*;
Minim minim;
AudioPlayer Ding;

int score = 0;
float playerX;
float playerY;
float bX;
float bY;
float bugSpeed;
float pSize;


//MovingLetters letters1;

void setup()
{
  size(1000, 900);
  playerX = width / 2;
  playerY = height - 80;
  pSize = 100;
  //letters1 = new MovingLetters(this, 50, 1, 0);
  minim = new Minim(this);
}


void drawBug(float bugX, float bugY, float bugSize)
{
  line(bugX +(bugSize *0.5), bugY, bugX, bugY +(bugSize *0.5)); //body
  line(bugX, bugY + (bugSize *0.5), bugX + bugSize, bugY + (bugSize *0.5)); //body
  line(bugX +(bugSize *0.5), bugY, bugX + bugSize, bugY + (bugSize *0.5));  //body

  line(bugX +(bugSize *0.2), bugY + (bugSize *0.5), bugX, bugY + bugSize); //left leg
  line(bugX +(bugSize *0.4), bugY + (bugSize *0.5), bugX, bugY + bugSize); //left leg

  line(bugX +(bugSize *0.6), bugY + (bugSize *0.5), bugX + bugSize, bugY + bugSize); //right leg
  line(bugX +(bugSize *0.8), bugY + (bugSize *0.5), bugX + bugSize, bugY + bugSize); //right leg

  line(bugX +(bugSize *0.3), bugY + (bugSize *0.4), bugX +(bugSize *0.7), bugY + (bugSize *0.4)); //mouth

  line(bugX +(bugSize *0.4), bugY + (bugSize *0.2), bugX +(bugSize *0.4), bugY + (bugSize *0.3)); //left eye
  line(bugX +(bugSize *0.6), bugY + (bugSize *0.2), bugX +(bugSize *0.6), bugY + (bugSize *0.3)); //right eye
}

void drawPlayer(float pX, float pY, float pSize)
{
  line(pX, pY +(pSize *0.75), pX + pSize, pY +(pSize *0.75)); //base
  line(pX, pY +(pSize *0.5), pX, pY +(pSize *0.75)); //left side
  line(pX, pY +(pSize *0.5), pX +(pSize *0.25), pY +(pSize *0.3)); //left arch
  line(pX +(pSize *0.25), pY +(pSize *0.3), pX +(pSize *0.75), pY +(pSize *0.3)); //top
  line(pX +(pSize *0.5), pY +(pSize *0.3), pX +(pSize *0.5), pY +(pSize *0.1)); //Gun
  line(pX +(pSize *0.75), pY +(pSize *0.3), pX +pSize, pY +(pSize *0.5)); //Right arch
  line(pX +pSize, pY +(pSize *0.5), pX +pSize, pY +(pSize *0.75)); //Right side

  if (keyPressed)
  {
    if (keyCode == UP)
    {
      line(pX +(pSize *0.5), pY +(pSize *0.1), pX +(pSize *0.5), 0);
    }
  }
}

void moveBug()
{
  if (frameCount %30 == 0)
  {
    bX += random(-100, 200);
    bY += random(25, 30);
  }
}


void draw()
{
  noCursor();
  background(255, 0);
  drawBug(bX, bY, 50); 
  //drawPlayer(playerX, playerY, pSize);
  moveBug();
  strokeWeight(2);
  line(mouseX, mouseY, mouseX - 10, mouseY);
  line(mouseX, mouseY, mouseX , mouseY - 10);
  line(mouseX, mouseY, mouseX , mouseY + 10);
  line(mouseX, mouseY, mouseX + 10 , mouseY);
  ellipse(mouseX, mouseY, 5, 5);
  
  if(mousePressed)
  {
    Ding = minim.loadFile("Blip_Select3.wav");
    Ding.play();
    if(dist(mouseX,mouseY,bX,bY)<50)
    {
      exit();
    }
  }
  
  if (keyPressed)
  {
    if (keyCode == LEFT && playerX >=0)
    {
      playerX-= 2;
    }
  }

  if (keyPressed)
  {
    if (keyCode == RIGHT && playerX < ( width - pSize))
    {
      playerX+= 2;
    }
  }
  
  //letters1.text("'scraic bai", 10, 10);

}



/*

 void gameScreen()
 {
 
 }
 
 void gameOver()
 {
 
 }
 
 void gameSplash()
 {
 
 }
 
 
 */
