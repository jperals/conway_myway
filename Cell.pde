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
    float redComponent = red(cellColor),
        greenComponent = green(cellColor),
        blueComponent = blue(cellColor);
    redComponent = applyRules(redComponent, redNeighbours);
    greenComponent = applyRules(greenComponent, greenNeighbours);
    blueComponent = applyRules(blueComponent, blueNeighbours);
    cellColor = color(redComponent, greenComponent, blueComponent);
  }
  public void draw() {
    fill(cellColor);
    rect(0, 0, cellSize, cellSize);
  }
  private float applyRules(float colorComponent, int numberOfNeighbours) {
    if(colorComponent == 0 && numberOfNeighbours == optimalNumberOfNeighbours ||
       colorComponent == 1 && numberOfNeighbours >= minNumberOfNeighbours && numberOfNeighbours <= maxNumberOfNeighbours) {
       return 1;
    }
    else {
      return 0;
    }
  }
  private int randomColorComponent() {
    return int(random(1) < 0.15);
  }
}

