#define LED 9
#define BUTTON 7

#define DOWN -1
#define UP 1
#define MAX_ANALOG 255

int direction = UP;
int i = 0;
int light_val = 0;
int state = 0;
int val = 0;
int old_val = 0;

void setup() {
  pinMode(LED, OUTPUT);
  pinMode(BUTTON, INPUT);
};

void changeLight() {
  if (state == 1) {
    if (light_val == MAX_ANALOG) {
      direction = DOWN;
    } else if (light_val == 0) {
      direction = UP;
    }
    light_val += direction;
    analogWrite(LED, light_val);
    delay(10);
  } else {
    analogWrite(LED, 0);
  }
};

void checkButton() {
  val = digitalRead(BUTTON); // read the input

  if ((val == HIGH) && (old_val == LOW)) {
    state = 1 - state;
    delay(10);
  }

  old_val = val;
};

void loop() {
  changeLight();
  checkButton();
}

