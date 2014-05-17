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
  tissue.update();
  tissue.draw();
}

