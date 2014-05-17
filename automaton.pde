int cellSize = 25;
Tissue tissue;

void setup() {
  size(500, 500);
  tissue = new Tissue(cellSize);
  noStroke();
}

void draw() {
  tissue.update();
  tissue.draw();
}

