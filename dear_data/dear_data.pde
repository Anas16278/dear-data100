Table table;

void setup() {
  size(900, 400);
  table = loadTable("data.csv", "header");
  println(table.getRowCount() + " rows loaded");
  noStroke();
}

void draw() {
  background(255);
  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    float w = row.getFloat("weight_kg");
    String muscle = row.getString("muscle");
    float x = 30 + i * 26;
    float y = height / 2;
    float d = sizeFromWeight(w);
    fill(colourFor(muscle));
    ellipse(x, y, d, d);
  }
}

float sizeFromWeight(float w) {
  return w * 0.4;
}

color colourFor(String m) {
  if (m.equals("chest")) return color(220, 60, 60);
  if (m.equals("shoulders")) return color(240, 150, 40);
  if (m.equals("triceps")) return color(230, 200, 50);
  if (m.equals("biceps")) return color(70, 160, 90);
  if (m.equals("back")) return color(60, 120, 200);
  return color(140, 90, 180);
}
