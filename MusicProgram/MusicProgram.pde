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
AudioMetaData song1MetaData1; //"song1's meta data"
//
void setup() {
  size(900, 900); //Remember display geometry
  minim = new Minim(this);//loads from data directory, loadFile should load from project folder, like loadImage()
  song1 = minim.loadFile("musicFolder/SomebodyThatIUsedToKnow.mp3");//Able to pass absolute path file name, and URL
  song1MetaData1 = song1.getMetaData(); //reads song meta 1, like song1, mimicking array notation
  //
  println("Start of Console");
  println("Click the console to Finish Starting this program");//See previoyus lesson for OS-level Button
  println("Title:", song1MetaData1.title() );
}//End setup
//
void draw() {
  if (song1.isLooping()) println("There are", song1.loopCount(), "loops left");
  if (song1.isPlaying() && !song1.isLooping()) println("Play Once");
  if (song1.isPlaying()) println("Time elapsed", song1.position()/1000, "Song Length", song1.length()/1000 ); //value in milliseconds
  //
  background(black);
  rect(width*1/4, height*0, width*1/2, height*1/10);
}//End draw
//
void keyPressed() {  
  //Only press a number for this code below
  if (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9') {//looping functions
  String keystr = String.valueOf(key);
  println("Looping", keystr, "times");
  println("Number of Repeats is", keystr);
  int num = int(keystr);
  song1.loop(num);
  }
  //
  //
    if (key=='l' || key=='L' ) song1.loop();
  //Alternate Play button
  if ( key=='p' || key=='P' ){ 
    if(song1.isPlaying()){
      song1.pause();
    } else if (song1.position()>=song1.length()-song1.length()*1/10){ //Special situation: at the end of the song (built-in stop button
    //End of Song Calculation: hardcode 1000 or use formula
    //Alternate formula:song1.length-song1,position <= 3500
    song1.rewind();
    song1.play();
    }else {
      song1.play();
    };//Parameter is in milliseconds from start of audio file to start of playing
    }
  //End play-pause button
  //
  //Forward and reverse button
  if (key=='f' || key=='F') song1.skip(3000); //Skip forward 3 second
  if (key=='r' || key=='R') song1.skip(-3000); //Skip backward, or reverse forward 3 second
  //
  /* Previous Play button and Loop button
  int loopNum = 2;//local variable plays once and loops twice
  if ( key=='l' || key=='L') song1.loop(loopNum); //parameter is number of repeats
*/
  if (key=='m' ||key=='M') {
  if(song1.isMuted() ) {
    song1.unmute();
  } else {
    song1.mute();
  }
}//End mute
//
  if(key=='s' || key=='S'){
    if (song1.isPlaying()) {//Stop Button
      song1.pause();
      song1.rewind();
    }else{
      song1.rewind();
    }
  }//End stop button
}//End keyPressed
//
void mousePressed() {

}//End mousePressed
//END MAIN
