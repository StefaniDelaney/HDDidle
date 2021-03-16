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
    text(packets, 463, 247);
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
