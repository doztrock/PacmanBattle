ProgressBar progressBar = new ProgressBar(50, 50, 350, 70);
int iteracion = 0;

void setup() {
  size(800, 600);
} 

void draw() {

  background(0);

  if (iteracion % 50 == 0)
    progressBar.setProgress(progressBar.getProgress() + 10);

  progressBar.show();

  iteracion++;
}
