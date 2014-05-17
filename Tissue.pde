class Tissue {
  Cell[][] cells;
  int cellSize, columns, rows;
  public Tissue(int cellSize) {
    this.cellSize = cellSize;
    columns = width/cellSize;
    rows = height/cellSize;
    cells = new Cell[rows][columns];
    for(int row = 0; row < rows; row++) {
      for(int column = 0; column < columns; column++) {
        cells[row][column] = new Cell(cellSize);
      }
    }
  }
  public void draw() {
    for(int row = 0; row < rows; row++) {
      pushMatrix();
      for(int column = 0; column < columns; column++) {
        cells[row][column].draw();
        translate(cellSize, 0);
      }
      popMatrix();
      translate(0, cellSize);
    }
  }
  public void update() {
    for(int row = 0; row < rows; row++) {
      for(int column = 0; column < columns; column++) {
        cells[row][column].update();
      }
    }
  }
}

