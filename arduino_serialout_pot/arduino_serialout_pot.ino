int potPin = 0;                 // Potentiometer connected to analog pin 0
int potValue = 0;               // Used to store the value read from the pot
int serialValue = 0;            // Used to store the serial value to send

void setup(){
  Serial.begin(9600);           // connect to the serial port at speed 9600 (baudrate)
}

void loop(){

  potValue = analogRead(potPin);                 // read the value from the pot
  serialValue = map(potValue, 0, 1023, 0, 255);  // scale pot value to 0-255
  
  //Serial.println(serialValue);
  Serial.write(serialValue);                     // send serial value to computer as a byte (not as a string like when we use println)

  delay(50); // wait a little while before sending again (so we're not sending too much data to Processing)
}


