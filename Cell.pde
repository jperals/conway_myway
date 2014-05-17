class Cell {
  public color cellColor;
  int cellSize;
  public Cell(int size) {
    cellColor = color(randomColorComponent(), randomColorComponent(), randomColorComponent());
    cellSize = size;
  }
  public void update(int[] colourNeighbours) {
    int redNeighbours = colourNeighbours[0],
        greenNeighbours = colourNeighbours[1],
        blueNeighbours = colourNeighbours[2];
    float red = red(cellColor),
        green = green(cellColor),
        blue = blue(cellColor);
    red = applyRules(red, redNeighbours);
    green = applyRules(green, greenNeighbours);
    blue = applyRules(blue, blueNeighbours);
    cellColor = color(red, green, blue);
  }
  public void draw() {
    fill(cellColor);
    rect(0, 0, cellSize, cellSize);
  }
  private float applyRules(float colorComponent, int numberOfNeighbours) {
    if(numberOfNeighbours == 3 ||
       numberOfNeighbours == 2 && colorComponent == 1) {
       colorComponent = 1;
    }
    else {
      colorComponent = 0;
    }
    return colorComponent;
  }
  private int randomColorComponent() {
    return int(random(1) < 0.5);
  }
}

