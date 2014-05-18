boolean paused = false;
int cellSize = 5;
int maxNumberOfNeighbours = 3,
    minNumberOfNeighbours = 2,
    optimalNumberOfNeighbours = 3,
    range = 1;
Grid grid;

void setup() {
  size(500, 500);
  frameRate(4);
  colorMode(RGB, 1);
  noStroke();
  grid = new Grid(cellSize);
}

void draw() {
  if(!paused) {
    grid.update();
    grid.draw();
  }
}

void keyPressed() {
  switch(key) {
    case ' ':
      paused = !paused;
      break;
    case 'q':
      minNumberOfNeighbours = min(minNumberOfNeighbours + 1, maxNumberOfNeighbours);
      println("minNumberOfNeighbours: " + minNumberOfNeighbours);
      break;
    case 'a':
      minNumberOfNeighbours --;
      println("minNumberOfNeighbours: " + minNumberOfNeighbours);
      break;
    case 'w':
      maxNumberOfNeighbours ++;
      println("maxNumberOfNeighbours: " + maxNumberOfNeighbours);
      break;
    case 's':
      maxNumberOfNeighbours = max(maxNumberOfNeighbours - 1, minNumberOfNeighbours);
      println("maxNumberOfNeighbours: " + maxNumberOfNeighbours);
      break;
    case 'r':
      grid = new Grid(cellSize);
      break;
    case '-':
      range = max(0, range - 1);
      break;
    case '+':
      range ++;
      println("range: " + range);
      break;
    case '0': case '1': case '2': case '3': case '4': case '5': case '6': case '7': case '8': case '9':
      optimalNumberOfNeighbours = int(key - 48);
      println("optimalNumberOfNeighbours: " + optimalNumberOfNeighbours);
  }
}

