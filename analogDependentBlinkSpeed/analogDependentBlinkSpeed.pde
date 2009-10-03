#define LED 9
#define LDR 0

int val=0;

void setup() {
  pinMode(LED, OUTPUT);
  // No need to set the LDR, it's autoinput because it's analog
}

void loop() {
  val = analogRead(LDR);
  digitalWrite(LED, HIGH);
  delay(val);
  digitalWrite(LED, LOW);
  delay(val);
}
