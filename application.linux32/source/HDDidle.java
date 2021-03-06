import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class HDDidle extends PApplet {

///////////////////////////////////
// HDDidle                       //
// created by stefani delaney    //
// and idle game involving semi  //
// realistic mechanics           //
// version v0.08                 //
///////////////////////////////////

public void setup() {
    
    //load save
    String[] saveData = loadStrings("savefile.txt");
    //bytes = float(saveData[0]);
    
}

public void draw() {
   background(0); //draw bg
   speedBonusAdd = (bytes * pow(1024, scalingLevel)) / (1048576 * (speedBonus + 1));
   if (speedBonusAdd >= 1.0f) speedBonusAdd = 1.0f;
   bitrate = ((carriers * 1) + (telegrams * 60) + (fax * 720) + (packets * 1500) + (dialup * 7168) + (multiplexers * 107520))/ pow(1024, scalingLevel); //calculate bitrate
   bitrate = bitrate * (speedBonus + 1) * (fileSystemBonus + 1);
   switchValue = (0.125f * switchMult * switchMult2 + (cps * bitrate)) / pow(1024, scalingLevel);
   drawHeader(); //draws above ui elements
   drawFrame();
   bitrateAdd();
   if (bytes >= 1073741824) scaleDownValues();
   println(scalingLevel);
}

public void drawHeader() {
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

public void setText() { //set colors for text
  fill(255);
  stroke(255);
}

public void setRect(int tabType) { //set colors for rectangles (buttons and surrounds)
  stroke(255);
  if (tabType == 0) { //normal
    fill(80);
  } else if (tabType == 1) { //selected
    fill(130);
  } else if (tabType == 2) {
    fill(60);
  }
}

public float convertBytes(float bytesIn) { //converts bytes to kb, mb, etc
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

public void bitrateAdd() {
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

public void scaleDownValues() { //basically shifts all values down by 1024
  scalingLevel++;
  bytes = bytes / 1024;
  linkSwitchPrice = linkSwitchPrice / 1024;
  cpsPrice = cpsPrice / 1024;
  carrierPrice = carrierPrice / 1024;
  telegramPrice = telegramPrice / 1024;
  faxPrice = faxPrice / 1024;
  packetPrice = packetPrice / 1024;
  dialupPrice = dialupPrice / 1024;
  multiplexerPrice = multiplexerPrice / 1024;
}

public void resetVars() {
  scalingLevel = 0;
  bytes = 0;
  linkSwitchPrice = 1;
  linkSwitchPriceMult = 1;
  linkSwitch = 0;
cpsPrice = 102400;
cpsPriceMult = 1;
cps = 0;
carrierPrice = 10; 
carrierPriceMult = 1;
carriers = 0;
telegramPrice = 1024;
telegramPriceMult = 1;
telegrams = 0;
faxPrice = 102400;
faxPriceMult = 1;
fax = 0;
packetPrice = 307200;
packetPriceMult = 1;
packets = 0;
dialupPrice = 1048576;
dialupPriceMult = 1;
dialup = 0;
multiplexerPrice = 10240000;
multiplexerPriceMult = 1;
multiplexers = 0;
switchMult = 1;
switchMult2 = 1;
}
public void drawFrame() {
  if (currentTab == 0) {
     //data tab
     textSize(20);
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
     setText();
     bytesD = convertBytes(switchValue);
     text(nf(bytesD, 0, 3), 12, 230);
     text(endUnit, 175, 230);
     setRect(0);
     rect(210, 40, 425, 40, 5);
     textSize(20);
     setText();
     text("link another switch", 215, 66);
     setRect(2);
     rect(457, 45, 75, 30, 5);
     rect(537, 45, 93, 30, 5);
     setText();
     bytesD = convertBytes(linkSwitchPrice);
     text(nf(bytesD, 0, 1), 542, 67);
     text(endUnit, 600, 67);
     text(linkSwitch, 463, 67);
     
    setRect(0);
    rect(210, 85, 425, 40, 5);
    textSize(20);
    setText();
    text("100% of bytes/s", 215, 111);
    setRect(2);
    rect(457, 90, 75, 30, 5);
    rect(537, 90, 93, 30, 5);
    setText();
    bytesD = convertBytes(cpsPrice);
    text(nf(bytesD, 0, 1), 542, 112);
    text(endUnit, 600, 112);
    text((int)cps, 463, 112);
  }
  else if (currentTab == 1) {
    textSize(20);
    setRect(0);
    rect(5, 40, 200, 200, 5);
    setText();
    text("total bitrate", 10, 62);
    setRect(2);
    rect(10, 70, 190, 165, 5);
    setText();
    textSize(40);
    bytesD = convertBytes(bitrate);
    text(nf(bytesD, 0, 3), 20, 140);
    String totalBitrate = endUnit + "/s";
    text(totalBitrate, 80, 190);
    
    setRect(0);
    rect(210, 40, 425, 40, 5);
    textSize(20);
    setText();
    text("carrier pidgeon 1b/s", 215, 66);
    setRect(2);
    rect(457, 45, 75, 30, 5);
    rect(537, 45, 93, 30, 5);
    setText();
    bytesD = convertBytes(carrierPrice);
    text(nf(bytesD, 0, 1), 542, 67);
    text(endUnit, 600, 67);
    text(carriers, 463, 67);
    
    setRect(0);
    rect(210, 85, 425, 40, 5);
    textSize(20);
    setText();
    text("telegram 60b/s", 215, 111);
    setRect(2);
    rect(457, 90, 75, 30, 5);
    rect(537, 90, 93, 30, 5);
    setText();
    bytesD = convertBytes(telegramPrice);
    text(nf(bytesD, 0, 1), 542, 112);
    text(endUnit, 600, 112);
    text(telegrams, 463, 112);

    setRect(0);
    rect(210, 130, 425, 40, 5);
    textSize(20);
    setText();
    text("fax machine 720b/s", 215, 156);
    setRect(2);
    rect(457, 135, 75, 30, 5);
    rect(537, 135, 93, 30, 5);
    setText();
    bytesD = convertBytes(faxPrice);
    text(nf(bytesD, 0, 1), 542, 157);
    text(endUnit, 600, 157);
    text(fax, 463, 157);
    
    setRect(0);
    rect(210, 175, 425, 40, 5);
    textSize(20);
    setText();
    text("packet switch 1.5kB/s", 215, 201);
    setRect(2);
    rect(457, 180, 75, 30, 5);
    rect(537, 180, 93, 30, 5);
    setText();
    bytesD = convertBytes(packetPrice);
    text(nf(bytesD, 0, 1), 542, 202);
    text(endUnit, 600, 202);
    text(packets, 463, 202);
    
    setRect(0);
    rect(210, 220, 425, 40, 5);
    textSize(20);
    setText();
    text("dial up modem 7kB/s", 215, 246);
    setRect(2);
    rect(457, 225, 75, 30, 5);
    rect(537, 225, 93, 30, 5);
    setText();
    bytesD = convertBytes(dialupPrice);
    text(nf(bytesD, 0, 1), 542, 247);
    text(endUnit, 600, 247);
    text(dialup, 463, 247);
    
    setRect(0);
    rect(210, 265, 425, 40, 5);
    textSize(20);
    setText();
    text("multiplexer 105kB/s", 215, 291);
    setRect(2);
    rect(457, 270, 75, 30, 5);
    rect(537, 270, 93, 30, 5);
    setText();
    bytesD = convertBytes(multiplexerPrice);
    text(nf(bytesD, 0, 1), 542, 291);
    text(endUnit, 600, 292);
    text(multiplexers, 463, 292);
  }
  else if (currentTab == 2) {
    textSize(20);
    setRect(0);
    rect(5, 40, 215, 215, 5);
    setText();
    text("current speed bonus", 10, 62);
    setRect(2);
    rect(10, 70, 205, 180, 5);
    textSize(40);
    setText();
    text(speedBonus, 5, 175);
    
    setRect(0);
    rect(225, 40, 410, 85, 5);
    textSize(20);
    setText();
    text("defrag drives (reset everything, max 1.0)", 230, 66);
    setRect(2);
    
    setRect(0);
    //rect(225, 85, 410, 40, 5);
    setRect(2);
    rect(537, 90, 93, 30, 5);
    textSize(20);
    setText();
    text("bonus if defragged now", 230, 111);
    text(speedBonusAdd, 540, 112);
  }
}
public void mousePressed() {
  mouseClick = detectMouseHeader();
  if (mouseClick != 9) {
    currentTab = mouseClick;
  } 
  mouseClick = detectMouseFrame();
  if (currentTab == 0){
    if (mouseClick == 1) {
      switchDir = !switchDir;
      bytesTemp = switchValue;
      bytes = bytes + bytesTemp;
    }
    else if (mouseClick == 2) {
      if (bytes >= linkSwitchPrice) {
        linkSwitch++;
        switchMult++;
        bytes = bytes - linkSwitchPrice;
        linkSwitchPriceMult = linkSwitchPriceMult * 1.01f;
        linkSwitchPrice = linkSwitchPrice * linkSwitchPriceMult;
      }
    }
    else if (mouseClick == 3) {
      if (bytes >= cpsPrice) {
        cps++;
        bytes = bytes - cpsPrice;
        cpsPriceMult = cpsPriceMult * 2.0f;
        cpsPrice = cpsPrice * cpsPriceMult;
      }
    }
  }
  else if (currentTab == 1) {
    if (mouseClick == 1) {
      if (bytes >= carrierPrice) {
        carriers++;
        bytes = bytes - carrierPrice;
        carrierPriceMult = carrierPriceMult * 1.1f;
        carrierPrice = carrierPrice * carrierPriceMult;
      }
    }
    else if (mouseClick == 2) {
      if (bytes >= telegramPrice) {
        telegrams++;
        bytes = bytes - telegramPrice;
        telegramPriceMult = telegramPriceMult * 1.1f;
        telegramPrice = telegramPrice * telegramPriceMult;
      }
    }
    else if (mouseClick == 3) {
      if (bytes >= faxPrice) {
        fax++;
        bytes = bytes - faxPrice;
        faxPriceMult = faxPriceMult * 1.1f;
        faxPrice = faxPrice * faxPriceMult;
      }
    }
    else if (mouseClick == 4) {
      if (bytes >= packetPrice) {
        packets++;
        bytes = bytes - packetPrice;
        packetPriceMult = packetPriceMult * 1.1f;
        packetPrice = packetPrice * packetPriceMult;
      }
    }
    else if (mouseClick == 5) {
      if (bytes >= dialupPrice) {
        dialup++;
        bytes = bytes - dialupPrice;
        dialupPriceMult = dialupPriceMult * 1.1f;
        dialupPrice = dialupPrice * dialupPriceMult;
      }
    }
     else if (mouseClick == 6) {
      if (bytes >= multiplexerPrice) {
        multiplexers++;
        bytes = bytes - multiplexerPrice;
        multiplexerPriceMult = multiplexerPriceMult * 1.1f;
        multiplexerPrice = multiplexerPrice * multiplexerPriceMult;
      }
    }
  }
  else if (currentTab == 2) {
     if (mouseClick == 1) {
        speedBonuses++;
        speedBonus = speedBonus + speedBonusAdd;
        resetVars();
  }
  }
}

public int detectMouseHeader() {
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

public int detectMouseFrame() {
  if (currentTab == 0) {
    if (mouseY >= 40 && mouseY <= 240 && mouseX >= 5 && mouseX <= 205) {
      return 1; //switch clicker
    }
    else if (mouseY >= 40 && mouseY <= 80 && mouseX >= 210 && mouseX <= 635) {
      return 2; //link switch
    }
    else if (mouseY >= 85 && mouseY <= 125 && mouseX >= 210 && mouseX <= 635) {
      return 3; //cps
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
    else if (mouseY >= 230 && mouseY <= 275 && mouseX >= 210 && mouseX <= 635) {
      return 5; //dial up
    }
    else if (mouseY >= 280 && mouseY <= 325 && mouseX >= 210 && mouseX <= 635) {
      return 6; //multiplexer
    }
  }
  else if (currentTab == 2) {
    if (mouseY >= 40 && mouseY <= 125 && mouseX >= 210 && mouseX <= 635) return 1;
  }
  return 0;
}
int dataTabState = 0;
int netTabState = 0;
int storTabState = 0;
int fsTabState = 0;
int currentTab = 0; //0 data, 1 network, 2 storage, 3 fs
int scalingLevel = 0; //used for scaling the values to account for the lack of size on floats
float speedBonus = 0.00f; //speed bonus for prestige
float speedBonusAdd = 0; //amount to add to speed bonus
int speedBonuses = 0; //used for exp math

float fileSystemBonus = 0; //bonus from file system upgrades

float linkSwitchPrice = 1;
float linkSwitchPriceMult = 1;
int linkSwitch = 0; //amount of linked switches

float cpsPrice = 102400;
float cpsPriceMult = 1;
long cps = 0;

float bitrate = 0;

float carrierPrice = 10; //carrier pidgeon price
float carrierPriceMult = 1;
int carriers = 0; //amount of carrier pidgeons

float telegramPrice = 1024;
float telegramPriceMult = 1;
int telegrams = 0;

float faxPrice = 102400;
float faxPriceMult = 1;
int fax = 0;

float packetPrice = 307200;
float packetPriceMult = 1;
int packets = 0;

float dialupPrice = 1048576;
float dialupPriceMult = 1;
int dialup = 0;

float multiplexerPrice = 10240000;
float multiplexerPriceMult = 1;
int multiplexers = 0;

float bytes = 99999990; //players byte count
float bytesTemp;
float bytesOut;
float bytesD = 0; //used to display
String endUnit = "by"; //used at the end of the display 
String display = ""; //final display
int frames = 0;

int mouseClick;

boolean switchDir = false;
float switchMult = 1; //used for linked
float switchMult2 = 1; //used for raid
float switchValue = 0; //bytes from flipping switch
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "HDDidle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
