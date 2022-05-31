//Libraries: uses scetch / import library / minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //Creattes object to access all functions
AudioPlayer song1;//creates "play list" variables holding extensions WAV, AIFF, AU, SND & MP3
//
void setup() {
  size(900, 900); //Remember display geometry
  minim = new Minim(this);//loads from data directory, loadFile should load from project folder, like loadImage()
  song1 = minim.loadFile("musicFolder/SomebodyThatIUsedToKnow.mp3");//Able to pass absolute path file name, and URL

  
}//End setup
//
void draw() {

}//End draw
//
void keyPressed() {
  //Only press a number f0r this code below
  String keystr = String.valueOf(key);
  println("Number of Repeats is", keystr);
  int num = int(keystr);
  song1.loop(num);
  /* Previous Play button and Loop button
  int loopNum = 2;//local variable plays once and loops twice
  if ( key=='p' || key=='P')song1.play();//Parameter is in milliseconds from start of audio file to start of playing
  if ( key=='l' || key=='L') song1.loop(loopNum); //parameter is number of repeats
*/
}//End keyPressed
//
void mousePressed() {

}//End mousePressed
//END MAIN
