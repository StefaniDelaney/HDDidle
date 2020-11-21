void drawFrame() {
  if (currentTab == 0) {
     //data tab
     setRect(0);
     rect(5, 40, 200, 200, 5);
     setText();
     text("binary switch", 10, 62);
     setRect(2);
     rect(10, 70, 190, 165, 5);
     setRect(1);
     ellipse(105, 150, 50, 50);
     setRect(0);
     if (switchDir == true) {
       rect(92, 80, 25, 70, 5);
     } else {
       rect(92, 150, 25, 70, 5);
     }
  }
}
