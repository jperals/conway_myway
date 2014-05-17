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
        int[] colourNeighbours = getColourNeighbours(row, column);
        cells[row][column].update(colourNeighbours);
      }
    }
  }
  private int[] getColourNeighbours(int i, int j) {
    int redNeighbours = 0,
        greenNeighbours = 0,
        blueNeighbours = 0;
    for(int row = max(i - range, 0); row <= min(i + 1, rows - 1); row++) {
      for(int column = max(j - range, 0); column <= min(j + 1, columns - 1); column++) {
        Cell cell = cells[row][column];
        color cellColor = cell.cellColor;
        redNeighbours += red(cellColor);
        greenNeighbours += green(cellColor);
        blueNeighbours += blue(cellColor);
      }
    }
    int[] neighbours = { redNeighbours, greenNeighbours, blueNeighbours };
    return neighbours;
  }
}

