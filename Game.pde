ProgressBar progressBar = new ProgressBar(15, 100, 50, 50, 350, 70);
int iteracion = 0;

void setup() {
  size(800, 600);
} 

void draw() {

  background(0);

  //progressBar.setProgress(iteracion);
  progressBar.show();

  iteracion++;
}
