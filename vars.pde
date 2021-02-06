int dataTabState = 0;
int netTabState = 0;
int storTabState = 0;
int fsTabState = 0;
int currentTab = 0; //0 data, 1 network, 2 storage, 3 fs
int raidStandard = 0; //raid numbers
int linkSwitchPrice = 1;
int linkSwitch = 0; //amount of linked switches
int bitrate = 0;
int carrierPrice = 10; //carrier pidgeon price
int carriers = 0; //amount of carrier pidgeons

float bytes = 0; //players byte count
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
