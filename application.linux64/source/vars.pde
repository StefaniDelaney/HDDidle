int dataTabState = 0;
int netTabState = 0;
int storTabState = 0;
int fsTabState = 0;
int currentTab = 0; //0 data, 1 network, 2 storage, 3 fs
int raidStandard = 0; //raid numbers
int scalingLevel = 0; //used for scaling the values to account for the lack of size on floats

float linkSwitchPrice = 1;
float linkSwitchPriceMult = 1;
int linkSwitch = 0; //amount of linked switches

float cpsPrice = 10;
float cpsPriceMult = 1;
long cps = 0;

float bitrate = 0;

float carrierPrice = 10; //carrier pidgeon price
float carrierPriceMult = 1;
int carriers = 0; //amount of carrier pidgeons

float telegramPrice = 120;
float telegramPriceMult = 1;
int telegrams = 0;

float faxPrice = 1024;
float faxPriceMult = 1;
int fax = 0;

float packetPrice = 10240;
float packetPriceMult = 1;
int packets = 0;

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
float switchValue = 0; //bytes from flipping switch
