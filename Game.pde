ProgressBar progressBar = new ProgressBar(50, 50, 150, 25);
int iteracion = 0;

void setup() {
  size(800, 600);
} 

void draw() {

  background(0);

  progressBar.setFill(255, 255, 0);
  progressBar.setStroke(100, 150, 255);  
  progressBar.show();

  iteracion++;
}
