final int _WIDTH = 700;
final int _HEIGHT = 700;
final int _RADIUS = -180;

float xPos = 100;
float yPos = 200;
float x = 0;
float y = 0;
int second = 0;
float tick = 0;
int prevDist = _RADIUS;

float degToRad(float deg) {
  return (deg * PI) / 180;
}

void setup() {
  size(700, 700);
}

float[] createSun() {
  
  int size = _WIDTH / 6;
  
  float[] pos = new float[2];
  pos[0] = _WIDTH / 2;
  pos[1] = _HEIGHT / 2;
  fill(#ff8c00);
  ellipse(pos[0], pos[1], size, size);
  return pos;
}

void createPlanet(float[] sunPos, int dist, float sizeMultiplier, int colour) {
  int addedRad = prevDist + dist;
  prevDist = addedRad;
  addedRad += sizeMultiplier * 10;
  float rad = ((_WIDTH/3) + dist + (addedRad));
  float speed = tick - (sizeMultiplier * 10);
  x = (sunPos[0] + (cos(degToRad(speed)) * rad));
  y = (sunPos[1] + (sin(degToRad(speed)) * rad));
  
  stroke(#838b83);
  noFill();
  ellipse(sunPos[0], sunPos[1], rad * 2, rad * 2);
  
  noStroke();
  fill(colour);
  ellipse(x, y, 5 * sizeMultiplier, 5 * sizeMultiplier);
  
}

void draw() {
  background(#000000);
  if(second != millis()) {
    second = millis();
    tick += 0.1;
  }
  
  prevDist = _RADIUS;

  float[] sunPos = createSun();
  createPlanet(sunPos, 5, 1, #cd5c5c); // Mercury
  createPlanet(sunPos, 10, 3, #eedd82); // Venus
  createPlanet(sunPos, 10, 4, #228b22); // Earth
  createPlanet(sunPos, 30, 2, #b22222); // Mars
  createPlanet(sunPos, 0, 10, #f4a460); // Jupiter
  createPlanet(sunPos, 35, 8, #f5deb3); // Saturn
  createPlanet(sunPos, 50, 6, #afeeee); // Uranus
  createPlanet(sunPos, 40, 5, #40e0d0); // Neptune
}