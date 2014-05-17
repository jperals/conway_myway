class Cell {
  public color cellColor;
  int cellSize;
  public Cell(int size) {
    cellColor = color(random(255), random(255), random(255));
    cellSize = size;
  }
  public void update() {
  }
  public void draw() {
    fill(cellColor);
    rect(0, 0, cellSize, cellSize);
  }
}

