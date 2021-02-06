///////////////////////////////////
// HDDidle                       //
// created by stefani delaney    //
// and idle game involving semi  //
// realistic mechanics           //
// version v0.08                 //
///////////////////////////////////

void setup() {
    size(640, 480);
    //load save
    String[] saveData = loadStrings("savefile.txt");
    //bytes = float(saveData[0]);
    
}

void draw() {
   background(0); //draw bg
   bitrate = ((carriers * 1) + (telegrams * 60) + (fax * 720) + (packets * 1500) )/ pow(1024, scalingLevel); //calculate bitrate
   switchValue = (1000000.125 * switchMult * switchMult2 + ((cps / 20) * bitrate)) / pow(1024, scalingLevel);
   drawHeader(); //draws above ui elements
   drawFrame();
   bitrateAdd();
   if (bytes >= 1073741824) scaleDownValues();
   println(scalingLevel);
}

void drawHeader() {
  textSize(20);
  //HDDidle
  //draw surround
  setRect(0);
  rect(5, 5, 90, 30, 5);
  //draw text
  setText();
  textSize(20);
  text("HDDidle", 10, 27);
  
  //data tab
  setRect(dataTabState);
  rect(100, 5, 55, 30, 5);
  setText();
  text("data", 105, 27);
  
  //network
  setRect(netTabState);
  rect(160, 5, 90, 30, 5);
  setText();
  text("network", 165, 27);
  
  //storage
  setRect(storTabState);
  rect(255, 5, 85, 30, 5);
  setText();
  text("storage", 260, 27);
  
  //filesystem
  setRect(fsTabState);
  rect(345, 5, 120, 30, 5);
  setText();
  text("filesystems", 350, 27);
  
  //data total
  setRect(0);
  rect(470, 5, 165, 30, 5);
  setText();
  bytesD = convertBytes(bytes);
  display = str(bytesD);
  //display = display + endUnit;
  text(display, 475, 27);
  text(endUnit, 600, 27);
  
  dataTabState = 0;
  netTabState = 0;
  storTabState = 0;
  fsTabState = 0;
  if (currentTab == 0) {
     dataTabState = 1;
  } else if (currentTab == 1) {
     netTabState = 1;
  } else if (currentTab == 2) {
     storTabState = 1;
  } else if (currentTab == 3) {
     fsTabState = 1;
  }
}

void setText() { //set colors for text
  fill(255);
  stroke(255);
}

void setRect(int tabType) { //set colors for rectangles (buttons and surrounds)
  stroke(255);
  if (tabType == 0) { //normal
    fill(80);
  } else if (tabType == 1) { //selected
    fill(130);
  } else if (tabType == 2) {
    fill(60);
  }
}

float convertBytes(float bytesIn) { //converts bytes to kb, mb, etc
  bytesOut = bytesIn;
  endUnit = "by";
  if (bytesIn >= pow(1024, 1 - scalingLevel)) {
     bytesOut = bytesIn / pow(1024, 1 - scalingLevel);
     endUnit = "kB";
  }  if (bytesIn >= pow(1024, 2 - scalingLevel)) {
     bytesOut = bytesIn / pow(1024, 2 - scalingLevel);
     endUnit = "MB";
  }  if (bytesIn >= pow(1024, 3 - scalingLevel)) {
     bytesOut = bytesIn / pow(1024, 3 - scalingLevel);
     endUnit = "GB";
  }  if (bytesIn >= pow(1024, 4 - scalingLevel)) {
     bytesOut = bytesIn / pow(1024, 4 - scalingLevel);
     endUnit = "TB";
  }  if (bytesIn >= pow(1024, 5 - scalingLevel)) {
     bytesOut = bytesIn / pow(1024, 5 - scalingLevel);
     endUnit = "PB";
  }  if (bytesIn >= pow(1024, 6 - scalingLevel)) {
     bytesOut = bytesIn / pow(1024, 6 - scalingLevel);
     endUnit = "EB";
  }  if (bytesIn >= pow(1024, 7 - scalingLevel)) {
     bytesOut = bytesIn / pow(1024, 7 - scalingLevel);
     endUnit = "ZB";
  }  if (bytesIn >= pow(1024, 8 - scalingLevel)) {
     bytesOut = bytesIn / pow(1024, 8 - scalingLevel);
     endUnit = "YB";
  }
  return bytesOut;
}

void bitrateAdd() {
  if (bitrate > 600) {
    float tempBitrate = bitrate / 60;
    bytes = bytes + tempBitrate;
  }
  else {
    frames++;
    if (frames == 59) {
    bytes = bytes + bitrate;
    frames = 0;  
  }
  }
}

void scaleDownValues() { //basically shifts all values down by 1024
  scalingLevel++;
  bytes = bytes / 1024;
  linkSwitchPrice = linkSwitchPrice / 1024;
  cpsPrice = cpsPrice / 1024;
  carrierPrice = carrierPrice / 1024;
  telegramPrice = telegramPrice / 1024;
  faxPrice = faxPrice / 1024;
  packetPrice = packetPrice / 1024;
}
