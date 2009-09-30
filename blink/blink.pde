// Example 01: Blinking LED

#define LED 13

void setup()
{
  pinMode(LED, OUTPUT); // sets the digital pin as output
}

void loop()
{
  digitalWrite(LED, HIGH); // turns the LED on
  delay(50);               // waits for .05 seconds
  digitalWrite(LED, LOW);  // turns the LED off
  delay(1000);             // waits for a second
}

