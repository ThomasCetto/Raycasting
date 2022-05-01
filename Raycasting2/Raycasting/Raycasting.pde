Wall[] walls = new Wall[8 + 4];
Source particle;

void setup() {
  size(900, 800);
  setWalls();
  particle = new Source();
}

void draw() {
  background(0);
  for (Wall wall : walls) {
    wall.show();
  }
  particle.update(mouseX, mouseY);
  particle.show();
  particle.look(walls);
}

void setWalls(){
  for (int i = 0; i < walls.length; i++) {
    walls[i] = new Wall(random(width), random(height), random(width), random(height));
  }
  walls[walls.length-4] = (new Wall(0, 0, width, 0));
  walls[walls.length-3] = (new Wall(width, 0, width, height));
  walls[walls.length-2] = (new Wall(width, height, 0, height));
  walls[walls.length-1] = (new Wall(0, height, 0, 0));
}
