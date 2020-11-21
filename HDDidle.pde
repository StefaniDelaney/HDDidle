void setup() {
    size(640, 480);
    //load save
    String[] saveData = loadStrings("savefile.txt");
    bytes = float(saveData[0]);
    
}

void draw() {
   background(0); //draw bg
   drawHeader(); //draws above ui elements
   
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

void drawButtons() {
   rect(0,0,0,0);
}

void setText() {
  fill(255);
  stroke(255);
}

void setRect(int tabType) {
  stroke(255);
  if (tabType == 0) {
    fill(80);
  }
}

float convertBytes(float bytesIn) {
  bytesOut = bytesIn;
  endUnit = "by";
  if (bytesIn >= bytesTemp) {
     bytesOut = bytesIn / 1024;
     endUnit = "kB";
  }  if (bytesIn >= pow(1024, 2)) {
     bytesOut = bytesIn / pow(1024, 2);
     endUnit = "MB";
  }  if (bytesIn >= pow(1024, 3)) {
     bytesOut = bytesIn / pow(1024, 3);
     endUnit = "GB";
  }  if (bytesIn >= pow(1024, 4)) {
     bytesOut = bytesIn / pow(1024, 4);
     endUnit = "TB";
  }  if (bytesIn >= pow(1024, 5)) {
     bytesOut = bytesIn / pow(1024, 5);
     endUnit = "PB";
  }  if (bytesIn >= pow(1024, 6)) {
     bytesOut = bytesIn / pow(1024, 6);
     endUnit = "EB";
  }  if (bytesIn >= pow(1024, 7)) {
     bytesOut = bytesIn / pow(1024, 7);
     endUnit = "ZB";
  }  if (bytesIn >= pow(1024, 8)) {
     bytesOut = bytesIn / pow(1024, 8);
     endUnit = "YB";
  }
  return bytesOut;
}