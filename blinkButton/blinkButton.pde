// Example 02: Turn on LED while button is pressed

#define LED 13    // the pin for the LED
#define BUTTON 7  // the input pin for the pushbutton

int val = 0;      // store the state of the input pin

void setup()
{
  pinMode(LED, OUTPUT); // sets the digital pin as output
  pinMode(BUTTON, INPUT); // sets the button as input
}

void loop()
{
  val = digitalRead(BUTTON); // read the input

  if (val == HIGH) {
    digitalWrite(LED, HIGH);
  } else {
    digitalWrite(LED, LOW);
  }
}

