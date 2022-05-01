class Source {
  PVector pos;
  Ray[] rays;
  Source() {
    this.pos = new PVector(width / 2, height / 2);
    this.rays = new Ray[360];
    for (int a = 0; a < this.rays.length; a += 1) {
      this.rays[a] = new Ray(this.pos, radians(a));
    }
  }

  void update(float x, float y) {
    this.pos.set(x, y);
  }

  void look(Wall[] walls) {
    for (int i = 0; i < this.rays.length; i++) {
      Ray ray = this.rays[i];
      PVector closest = null;
      float dist = 1000000;
      for (Wall wall : walls) {
        PVector temp = ray.cast(wall);
        if (temp != null) {
          float d = PVector.dist(this.pos, temp);
          if (d < dist) {
            dist = d;
            closest = temp;
          }
        }
      }
      if (closest != null) {
        stroke(255, 100);
        line(this.pos.x, this.pos.y, closest.x, closest.y);
      }
    }
  }

  void show() {
    fill(255);
    ellipse(this.pos.x, this.pos.y, 4, 4);
    for (Ray ray : this.rays) {
      ray.show();
    }
  }
}
