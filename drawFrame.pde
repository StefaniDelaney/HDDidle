void drawFrame() {
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
    text(endUnit, 80, 190);
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
  }
  else if (currentTab == 2) {
    textSize(20);
    setRect(0);
    rect(5, 40, 215, 215, 5);
    setText();
    text("current raid standard", 10, 62);
    setRect(2);
    rect(10, 70, 205, 180, 5);
    textSize(100);
    setText();
    text(raidStandard, 80, 200);
    setRect(0);
    rect(225, 40, 410, 40, 5);
    textSize(20);
    setText();
    if (raidStandard == 0) {
      text("raid 1", 230, 66);
      setRect(2);
      
    }
  }
}
