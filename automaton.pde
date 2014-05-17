boolean paused = false;
int cellSize = 25;
int maxNumberOfNeighbours = 3,
    minNumberOfNeighbours = 2,
    optimalNumberOfNeighbours = 3;
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
  switch(key) {
    case ' ':
      paused = !paused;
      break;
    case 'q':
      minNumberOfNeighbours ++;
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
      maxNumberOfNeighbours --;
      println("maxNumberOfNeighbours: " + maxNumberOfNeighbours);
      break;
    case 'r':
      tissue = new Tissue(cellSize);
      break;
    default:
      optimalNumberOfNeighbours = int(key - 48);
      println("optimalNumberOfNeighbours: " + optimalNumberOfNeighbours);
  }
}

