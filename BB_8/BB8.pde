class BB8 {
  float x, y, sBody, sHead, rot, hang;
  
  color BODY = color(210, 214, 225);
  color BODY_DARKER = color(192, 193, 198);
  color BODY_DARKERER = color(149, 154, 160);
  color ORANGE = color(230, 120, 57);
  
  PGraphics body, head;
  
  BB8() {
    x = width/2;
    y = height/2;
    sBody = 150;
    sHead = sBody*0.6;
    
    body = createGraphics((int)sBody, (int)sBody);
    head = createGraphics((int)sHead, (int)sHead);
    
    body.beginDraw();
    body.background(255, 0);
    body.noStroke();
    body.fill(BODY);
    body.translate(sBody/2, sBody/2);
      body.ellipse(0, 0, sBody, sBody);
      body.pushMatrix();
      body.translate(sBody*0.14, -sBody*0.27);
        body.shearX(PI*0.08);
        body.pushStyle();
        body.stroke(ORANGE);
        body.strokeWeight(10);
        body.noFill();
          body.ellipse(0, 0, sBody/2.7, sBody/2.7);    
        body.popStyle();
      body.popMatrix();
    body.endDraw();
    
    head.beginDraw();
    head.background(255, 0);
    head.noStroke();
    head.fill(BODY);
    head.translate(sHead/2, sHead/2);
    head.fill(BODY);
      head.arc(0, 0, sHead, sHead, -PI, 0);
      
      head.fill(BODY_DARKER);
      head.quad(-sHead/2, 0, sHead/2, 0, sHead/2-9, 9, -sHead/2+9, 9);
      head.fill(BODY_DARKERER);
      head.quad(-sHead/2, 1, sHead/2, 1, sHead/2-3, 3, -sHead/2+3, 3);
    head.endDraw();
  }
  
  void drawing() {
    pushMatrix();
    translate(x, y + sBody/2+4);
      rotate(radians(rot));
      image(body, 0, 0);
    popMatrix();
    
    pushMatrix();
    translate(x -sHead*0.1, y);
      rotate(radians(hang));
      image(head, 0, 0);    
    popMatrix();
    
    rot -= 4;
    if (frameCount % 30 == 0) hang = hang == -6 ? -4 : -6;
  }
  
}