import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port

PImage treble;
import processing.sound.*;
SoundFile c, d, e, f, g, a, b, C, D, E, F, G;
void setup()
{
  size(400, 400);
  background(255, 255, 250);
  
  // clefs
  imageMode(CENTER);
  treble = loadImage("treble.png");
  
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw()
{
  noFill();
  frameRate(60);
  
  // clef positioning
  image(treble, 42, 200, 100, 170);
  
  // staves
  for(int i = 1; i <= 5; i++)
  {
    line(0, (i * 25) + 115, width, (i * 25) + 115);
  }
  
  if ( myPort.available() > 0) 
  {  
    // If data is available,
    val = myPort.readStringUntil('\n');         // read it and store it in val
  } 
  println(val); //print it out in the console
  delay(800);
}

//draws the note
void drawit(float y)
{
  frameRate(5);
  fill(0, 0, 0);
  ellipse(200, y, 45, 25);
  rect(200 + 15, y - 70, 7, 70); 
}

// note identifier
void textit(char x)
{
  textAlign(CENTER);
  textSize(40);
  text(x, 200, 320);
}

// octave identifier
void octaveit(char x)
{ 
  textAlign(CENTER);
  textSize(20);
  text(x, 220, 325);
}

// plays the note
void playit(char letter)
{
  // load an mp3 file from the /data of this sketch
  if(letter == 'c'){c = new SoundFile(this, "c.mp3"); c.play(1.0);}
  if(letter == 'd'){d = new SoundFile(this, "d.mp3"); d.play(1.0);}
  if(letter == 'e'){e = new SoundFile(this, "e.mp3"); e.play(1.0);}
  if(letter == 'f'){f = new SoundFile(this, "f.mp3"); f.play(1.0);}
  if(letter == 'g'){g = new SoundFile(this, "g.mp3"); g.play(1.0);}
  if(letter == 'a'){a = new SoundFile(this, "a.mp3"); a.play(1.0);}
  if(letter == 'b'){b = new SoundFile(this, "b.mp3"); b.play(1.0);}
  if(letter == 'C'){C = new SoundFile(this, "C5.mp3"); C.play(1.0);}
  if(letter == 'D'){D = new SoundFile(this, "D5.mp3"); D.play(1.0);}
  if(letter == 'E'){E = new SoundFile(this, "E5.mp3"); E.play(1.0);}
  if(letter == 'F'){F = new SoundFile(this, "F5.mp3"); F.play(1.0);}
  if(letter == 'G'){G = new SoundFile(this, "G5.mp3"); G.play(1.0);}
}
void keyPressed()
{
  if (key == 's'){saveFrame("sample.png");}
  
  // Octave 4
  else if(key == 'c'){drawit(265); textit('C'); octaveit('4'); playit('c');}
  else if(key == 'd'){drawit(252.5); textit('D'); octaveit('4'); playit('d');}
  else if(key == 'e'){drawit(240); textit('E'); octaveit('4'); playit('e');}
  else if(key == 'f'){drawit(227.5); textit('F'); octaveit('4'); playit('f');}
  else if(key == 'g'){drawit(215); textit('G'); octaveit('4'); playit('g');}
  else if(key == 'a'){drawit(202.5); textit('A'); octaveit('4'); playit('a');}
  else if(key == 'b'){drawit(190); textit('B'); octaveit('4'); playit('b');}
  
  // Octave 5
  else if(key == 'C'){drawit(177.5); textit('C'); octaveit('5'); playit('C');}
  else if(key == 'D'){drawit(165); textit('D'); octaveit('5'); playit('D');}
  else if(key == 'E'){drawit(152.5); textit('E'); octaveit('5'); playit('E');}
  else if(key == 'F'){drawit(140); textit('F'); octaveit('5'); playit('F');}
  else if(key == 'G'){drawit(127.5); textit('G'); octaveit('5'); playit('G');}
}
