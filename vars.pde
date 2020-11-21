int dataTabState = 0;
int netTabState = 0;
int storTabState = 0;
int fsTabState = 0;
int currentTab = 0; //0 data, 1 network, 2 storage, 3 fs

float bytes = 0; //players byte count
float bytesTemp;
float bytesOut;
float bytesD = 0; //used to display
String endUnit = "by"; //used at the end of the display 
String display = ""; //final display

int mouseClick;

boolean switchDir = false;
float switchMult = 1;
