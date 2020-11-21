void mousePressed() {
  mouseClick = detectMouseHeader();
  if (mouseClick != 9) {
    currentTab = mouseClick;
  } 
  mouseClick = detectMouseFrame();
  if (mouseClick == 0) {
    switchDir = !switchDir;
    bytesTemp = 0.125 * switchMult;
    bytes = bytes + bytesTemp;
  }
}

int detectMouseHeader() {
  if (mouseY >= 5 && mouseY <= 35) {
    if (mouseX >= 100 && mouseX <= 155) {
      return 0;
    } else if (mouseX >= 160 && mouseX <= 250) {
      return 1;
    } else if (mouseX >= 255 && mouseX <= 340) {
      return 2;
    } else if (mouseX >= 345 && mouseX <= 465) {
      return 3;
    } 
  }
  return 9;
}

int detectMouseFrame() {
  if (mouseY >= 5 && mouseY <= 205 && mouseX >= 40 && mouseX <= 240) {
    return 0;
  }
  return 9;
}
