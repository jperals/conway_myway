boolean paused = false;
int cellSize = 25;
Tissue tissue;

void setup() {
  size(500, 500);
  frameRate(4);
  colorMode(RGB, 1);
  noStroke();
  tissue = new Tissue(cellSize);
}

void draw() {
  if(!paused) {
    tissue.update();
    tissue.draw();
  }
}

void keyPressed() {
  if(key == ' ') {
    paused = !paused;
  }
}

