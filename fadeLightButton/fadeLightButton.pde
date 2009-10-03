#define LED 9     // Be sure to use a 1kOhm resisitor instaed of 10k. 
                  // It'll be brighter
#define BUTTON 7

#define DOWN -1
#define UP 1
#define MAX_ANALOG 255

#define OFF   0
#define SOLID 1
#define FADE  2

int direction = DOWN;
int i = 0;
int light_val = 255;
int state = 0;
int val = 0;
int old_val = 0;

void setup() {
  pinMode(LED, OUTPUT);
  pinMode(BUTTON, INPUT);
};

void changeLight() {
  if (state == FADE) {
    if (light_val == MAX_ANALOG) {
      direction = DOWN;
    } else if (light_val == 0) {
      direction = UP;
    }
    light_val += direction;
    analogWrite(LED, light_val);
    delay(10);
  } else if (state == SOLID) {
    digitalWrite(LED, HIGH);
    direction = DOWN;
    light_val = 255;
  } else {
    analogWrite(LED, 0);
  }
};

void checkButton() {
  val = digitalRead(BUTTON); // read the input

  if ((val == HIGH) && (old_val == LOW)) {
    if (state == FADE) {
      state = OFF;
    } else {
      state += 1;
    }
    delay(10);
  }

  old_val = val;
};

void loop() {
  changeLight();
  checkButton();
}

