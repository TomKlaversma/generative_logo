// GLOBAL VARIABLES
Table data;
int[] tijd = new int[24];
int[] act = new int[24];
int[] vormgeven = new int[24];
int[] programmeren = new int[24];
int[] muziek = new int[24];
int[] sporten = new int[24];
int[] overig = new int[24];

// versturen van data
// donkerb, midb, lichtb, orangje, geel
int[] all_colours = {
  #2490cf, #25a4d6, #73b9dc, #f9a21a, #fbcf12
};
// maak variabelen aan voor de waardes waarmee je gaat werken
int[] d = new int[7];
float r1, r2, r3, r4, r5;
int size;
int startY;
int startX = 450;
int logo_grootte = 300;
int y = startY;
int x = startX;
int textsize = 44;
int grid = 30;

Triangle[] triangles = new Triangle[5];

int dir = 1; // omhoog, tenzij anders

void setup() {

  // setup document
  smooth();
  size(800, 600);
  background(255);

  // variables
  startY = (height - logo_grootte) / 2;
  y = startY;

  PFont myFont = createFont("Helvetica-Bold", 32);
  textFont(myFont);
  fill(#9a9a9a);
  textAlign(RIGHT);
  textSize(textsize);
  text("Tom", startX - textsize, startY + logo_grootte/2 - textsize/2);
  text("Klaversma", startX - textsize, startY + logo_grootte/2 + textsize/2);

  // lees dataset uit
  // csv bestand
  data =  loadTable("data_dag.csv", "header");
  int i = 0;
  for (TableRow row : data.rows ()) {
    tijd[i] = row.getInt("Tijd");
    act[i] = row.getInt("Activiteit");
    vormgeven[i] = row.getInt("Vormgeven");
    programmeren[i] = row.getInt("Programmeren");
    muziek[i] = row.getInt("Muziek");
    sporten[i] = row.getInt("Sporten");  
    overig[i] = row.getInt("Overig");
    i++;
  }

  // ok, klaar met uitlezen, bepaal wat je wilt gebruiken
  for (int j = 0; j < tijd.length; j++) {
    // bekijk de data van het matchende uur
    if (tijd[j] == hour()) {
      d[0] = tijd[j];
      d[1] = act[j];
      d[2] = muziek[j];
      d[3] = sporten[j];
      d[4] = overig[j];
      d[5] = vormgeven[j];
      d[6] = programmeren[j];
    }
  }

  // genereer driehoeken
  int data_i = 2;
  for (int j = 0; j<triangles.length; j++) {

    // bereken de grootte van de driehoek, nu nog random
    // maximale grootte is 300 px hoog / breed, minimaal 300
    size = ceil((d[data_i] / 10)) * grid;
    data_i++;
    // bereken de richting van de driehoek
    if (ceil(random(-2, 3)) > 0) {
      // van links naar rechts
      dir = 1;
    } else {
      // naar boven
      dir = 0;
    }

    // kijk naar de grootte zodat je weet of het buiten het kader valt:
    calculate_vertical(size, dir);
    calculate_horizontal(size, dir);
    triangles[j] = new Triangle(all_colours[j], size, dir, x, y);
    triangles[j].build();
  }
}

void draw() {
  // doe animaties, check of het uur verloopt
}

