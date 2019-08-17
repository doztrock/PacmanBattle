ProgressBar progressBar = new ProgressBar(50, 50, 350, 70);
int iteracion = 0;

void setup() {
  size(800, 600);
  progressBar.setProgress(0);
} 

void draw() {

  background(0);

  if (iteracion % 10 == 0)
    progressBar.setProgress(0);

  progressBar.show();

  iteracion++;
}
