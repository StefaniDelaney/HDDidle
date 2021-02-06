void mousePressed() {
  mouseClick = detectMouseHeader();
  if (mouseClick != 9) {
    currentTab = mouseClick;
  } 
  mouseClick = detectMouseFrame();
  if (currentTab == 0){
    if (mouseClick == 1) {
      switchDir = !switchDir;
      bytesTemp = 0.125 * switchMult * switchMult2;
      bytes = bytes + bytesTemp;
    }
    else if (mouseClick == 2) {
      if (bytes >= linkSwitchPrice) {
        linkSwitch++;
        switchMult++;
        bytes = bytes - linkSwitchPrice;
        linkSwitchPrice++;
        linkSwitchPrice = linkSwitchPrice * 2;
      }
    }
  }
  else if (currentTab == 1) {
    if (mouseClick == 1) {
      if (bytes >= carrierPrice) {
        carriers++;
        bitrate++;
        bytes = bytes - carrierPrice;
        carrierPrice = carrierPrice * 2;
      }
    }
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
  if (currentTab == 0) {
    if (mouseY >= 40 && mouseY <= 240 && mouseX >= 5 && mouseX <= 240) {
      return 1; //switch clicker
    }
    else if (mouseY >= 40 && mouseY <= 80 && mouseX >= 210 && mouseX <= 635) {
      return 2; //link switch
    }
  }
  else if (currentTab == 1) {
    if (mouseY >= 40 && mouseY <= 80 && mouseX >= 210 && mouseX <= 635) {
      return 1; //carrier pidgeon
    }
  }
  else if (currentTab == 2) {
  }
  return 0;
}
