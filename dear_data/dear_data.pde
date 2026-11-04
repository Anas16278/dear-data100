// Dear Data 100: my gym log
// Each circle = one exercise. Size = weight (kg). Colour = muscle group.

Table table;

void setup() {
  size(900, 400);
  table = loadTable("data.csv", "header");
  println(table.getRowCount() + " rows loaded");
  noStroke();
}

void draw() {
  background(255);
  int n = table.getRowCount();
  float gap = (width - 60) / float(max(n - 1, 1));
  for (int i = 0; i < n; i++) {
    TableRow row = table.getRow(i);
    float w = row.getFloat("weight_kg");
    String muscle = row.getString("muscle");
    float d = sizeFromWeight(w);
    fill(colourFor(muscle));
    ellipse(30 + i * gap, height / 2, d, d);
  }
}

// Takes a weight and returns a circle size
float sizeFromWeight(float w) {
  return w * 0.4;
}

// Takes a muscle name and returns a colour
color colourFor(String m) {
  if (m.equals("chest")) return color(220, 60, 60);
  if (m.equals("shoulders")) return color(240, 150, 40);
  if (m.equals("triceps")) return color(230, 200, 50);
  if (m.equals("biceps")) return color(70, 160, 90);
  if (m.equals("back")) return color(60, 120, 200);
  return color(140, 90, 180);
}
