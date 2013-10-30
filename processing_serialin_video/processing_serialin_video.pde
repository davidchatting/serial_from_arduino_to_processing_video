import processing.video.*;
import processing.serial.*;

Movie sunriseMovie;
Serial serial;

void setup() {
  size(480,360);
  background(0);
  
  sunriseMovie = new Movie(this, "sunrise.mov");
  serial=new Serial(this,Serial.list()[0],9600);
}

void draw() {
  image(sunriseMovie,0,0,480,360);
  
  if(serial.available() > 0){
    int value=serial.read();  //read the value from the auduino
    float time=map(value, 0, 255, 0, sunriseMovie.duration());  //calculate the time to jump to
    sunriseMovie.jump(time);
    sunriseMovie.play();
    sunriseMovie.pause();
  }
}

void movieEvent(Movie movie) {
  movie.read();
}
