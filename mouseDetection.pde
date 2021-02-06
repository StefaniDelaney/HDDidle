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
        linkSwitchPriceMult = linkSwitchPriceMult * 1.1;
        linkSwitchPrice = linkSwitchPrice * linkSwitchPriceMult;
      }
    }
  }
  else if (currentTab == 1) {
    if (mouseClick == 1) {
      if (bytes >= carrierPrice) {
        carriers++;
        bitrate++;
        bytes = bytes - carrierPrice;
        carrierPriceMult = carrierPriceMult * 1.1;
        carrierPrice = carrierPrice * carrierPriceMult;
      }
    }
    else if (mouseClick == 2) {
      if (bytes >= telegramPrice) {
        telegrams++;
        bitrate = bitrate + 60;
        bytes = bytes - telegramPrice;
        telegramPriceMult = telegramPriceMult * 1.1;
        telegramPrice = telegramPrice * telegramPriceMult;
      }
    }
    else if (mouseClick == 3) {
      if (bytes >= faxPrice) {
        fax++;
        bitrate = bitrate + 720;
        bytes = bytes - faxPrice;
        faxPriceMult = faxPriceMult * 1.1;
        faxPrice = faxPrice * faxPriceMult;
      }
    }
    else if (mouseClick == 4) {
      if (bytes >= packetPrice) {
        packets++;
        bitrate = bitrate + 1500;
        bytes = bytes - packetPrice;
        packetPriceMult = packetPriceMult * 1.1;
        packetPrice = packetPrice * packetPriceMult;
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
    if (mouseY >= 40 && mouseY <= 240 && mouseX >= 5 && mouseX <= 205) {
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
    else if (mouseY >= 85 && mouseY <= 125 && mouseX >= 210 && mouseX <= 635) {
      return 2; //telegram
    }
    else if (mouseY >= 130 && mouseY <= 175 && mouseX >= 210 && mouseX <= 635) {
      return 3; //fax
    }
    else if (mouseY >= 180 && mouseY <= 225 && mouseX >= 210 && mouseX <= 635) {
      return 4; //packet
    }
  }
  else if (currentTab == 2) {
  }
  return 0;
}
