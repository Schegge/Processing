public void drawRiver() {
  fill(168, 202, 186, 100);
  rect(0, 0, width, height);
  noStroke();
  for(int t = -50; t <= width; t += 50) {
    for(int z = -50; z <= height; z += 50) {
      fill(255, 255, 255, random(5));
      ellipse(t, z, 80, 80);
    }
  }
  fill(255, 255, 255, 10);
  rect(0, 0, width, limit);
  rect(0, height-limit, width, height);
  rect(0, 0, limit, height);
  rect(width-limit, 0, width, height);
}