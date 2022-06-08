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
Boolean pauseTrue=false, stopTrue = false;
int numberOfSongs=4;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];//creates "play list" variables holding extensions WAV, AIFF, AU, SND & MP3
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]; //"song1's meta data"
color black=0, purple = #6611D6;
PFont titleFont;
int currentSong = numberOfSongs - numberOfSongs;

//
void setup() {
  size(900, 900); //Remember display geometry
  minim = new Minim(this);//loads from data directory, loadFile should load from project folder, like loadImage()
  song[currentSong] = minim.loadFile("musicFolder/SomebodyThatIUsedToKnow.mp3");//Able to pass absolute path file name, and URL
  song[currentSong+=1] = minim.loadFile("musicFolder/Without Me.mp3");
  song[currentSong+=1] = minim.loadFile("musicFolder/Jetpack Joyride Theme.mp3");
  song[currentSong+=1] = minim.loadFile("musicFolder/[Electro] - Laszlo - Supernova [Monstercat Release].mp3");
  //
  //
  currentSong-=currentSong; //currentSong = currentsong - currentsong
  for (int i=currentSong; i<song.length; i++) {
   songMetaData[i] = song[i].getMetaData();
  }//End meta data
  /*
  songMetaData[] = song[].getMetaData(); //reads song meta 1, like song1, mimicking array notation
  songMetaData[] = song[].getMetaData();
  songMetaData[] = song[].getMetaData();
  songMetaData[] = song[].getMetaData();
  */
  titleFont = createFont("Javanese Text", 48);
  //
  println("Start of Console");
  println("Click the console to Finish Starting this program");//See previoyus lesson for OS-level Button
  println("Title:", songMetaData[currentSong].title() );
}//End setup
//
void draw() {
  if (song[currentSong].isLooping()) println("There are", song[currentSong].loopCount(), "loops left");
  if (song[currentSong].isPlaying() && !song[currentSong].isLooping()) println("Play Once");
  if (song[currentSong].isPlaying()) println("Time elapsed", song[currentSong].position()/1000, "Song Length", song[currentSong].length()/1000 ); //value in milliseconds
  if (!song[currentSong].isPlaying()) {
  if(!song[currentSong].isPlaying() && currentSong <=2 && pauseTrue == false && stopTrue == false) {
  song[currentSong].pause();
  song[currentSong].rewind();
  currentSong+=1;
  song[currentSong].play();
  } else if (currentSong == 3 && !song[currentSong].isPlaying() && pauseTrue==false && stopTrue == false) {
  song[currentSong].pause();
  song[currentSong].rewind();
  currentSong -= currentSong;
  song[currentSong].play();
  } 
  } 
  //
  background(black);
  rect(width*1/4, height*0, width*1/2, height*2/10);
  fill(purple);
  textAlign(CENTER,CENTER);
  textFont(titleFont, 30);
  text(songMetaData[currentSong].title(), width*1/4, height*0, width*1/2, height*1/10);
  fill(255);
  //
  fill(purple);
  textAlign(CENTER,CENTER);
  textFont(titleFont, 20);
  text (song[currentSong].position()/1000 + "/" + song[currentSong].length()/1000, width*1/4, height*0, width*1/2, height*2/10);
  fill(255);
}//End draw
//
void keyPressed() {  
  //Only press a number for this code below
  if (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9') {//looping functions
  String keystr = String.valueOf(key);
  println("Looping", keystr, "times");
  println("Number of Repeats is", keystr);
  int num = int(keystr);
  song[currentSong].loop(num);
  }
  //
  //
    if (key=='l' || key=='L' ) song[currentSong].loop();
  //Alternate Play button
  if ( key=='p' || key=='P' ){ 
    if(song[currentSong].isPlaying()){
      song[currentSong].pause();
      pauseTrue=true;
    } else if (song[currentSong].position()>=song[currentSong].length()-song[currentSong].length()*1/10){ //Special situation: at the end of the song (built-in stop button
    //End of Song Calculation: hardcode 1000 or use formula
    //Alternate formula:song1.length-song1,position <= 3500
    song[currentSong].rewind();
    song[currentSong].play();
    }else {
      song[currentSong].play();
      pauseTrue=false;
      stopTrue=false;
    };//Parameter is in milliseconds from start of audio file to start of playing
    }
  //End play-pause button
  //
  //Forward and reverse button
  if (key=='f' || key=='F') song[currentSong].skip(5000); //Skip forward 3 second
  if (key=='r' || key=='R') song[currentSong].skip(-5000); //Skip backward, or reverse forward 3 second
  //
  /* Previous Play button and Loop button
  int loopNum = 2;//local variable plays once and loops twice
  if ( key=='l' || key=='L') song1.loop(loopNum); //parameter is number of repeats
*/
  if (key=='m' ||key=='M') {
  if(song[currentSong].isMuted() ) {
    song[currentSong].unmute();
  } else {
    song[currentSong].mute();
  }
}//End mute
//
  if(key=='s' || key=='S'){
    if (song[currentSong].isPlaying()) {//Stop Button
      song[currentSong].pause();
      song[currentSong].rewind();
      stopTrue=true;
    }else{
      song[currentSong].rewind();
    }
  }//End stop button
  //
  if (key=='n'|| key=='N') {
  if(song[currentSong].isPlaying() && currentSong <=2) {
  song[currentSong].pause();
  song[currentSong].rewind();
  currentSong++;
  song[currentSong].play();
  } else if (currentSong >= 3 && song[currentSong].isPlaying()) {
  song[currentSong].pause();
  song[currentSong].rewind();
  currentSong -= currentSong;
  song[currentSong].play();
  } else if (currentSong >= 3 && !song[currentSong].isPlaying()) {
  song[currentSong].pause();
  song[currentSong].rewind();
  currentSong -= currentSong;
  }
  else {
  song[currentSong].pause();
  song[currentSong].rewind();
  currentSong++;
  }
  }
  //
  if (key=='b'|| key=='B') {
  if(song[currentSong].isPlaying() && currentSong >=1) {
  song[currentSong].pause();
  song[currentSong].rewind();
  currentSong-=1;
  song[currentSong].play();
  } else if (currentSong <= 0 && song[currentSong].isPlaying()) {
  song[currentSong].pause();
  song[currentSong].rewind();
  currentSong+=numberOfSongs-1;
  song[currentSong].play();
  } else if (currentSong <= 0 && !song[currentSong].isPlaying()) {
  song[currentSong].pause();
  song[currentSong].rewind();
  currentSong+=numberOfSongs-1;
  }
  else {
  song[currentSong].pause();
  song[currentSong].rewind();
  currentSong-=1;
  }
  }
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//END MAIN
