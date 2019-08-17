ProgressBar progressBar1 = new ProgressBar(50, 50, 350, 50);
ProgressBar progressBar2 = new ProgressBar(150, 150, 500, 90);
ProgressBar progressBar3 = new ProgressBar(250, 250, 150, 110);

int iteracion = 0;

void setup() {

  size(800, 600);

  progressBar1.setProgress((int) random(5, 95));
  progressBar2.setProgress((int) random(5, 95));
  progressBar3.setProgress((int) random(5, 95));

  return;
} 

void draw() {

  background(0);

  if (iteracion % (int) random(20, 100) == 0) {
    progressBar1.setProgress((int) random(5, 95));
    progressBar2.setProgress((int) random(5, 95));
    progressBar3.setProgress((int) random(5, 95));
  }

  progressBar1.show(100, 100, 100, (int) random(0, 255), (int) random(0, 255), (int) random(0, 255));
  progressBar2.show(200, 200, 200, (int) random(0, 255), (int) random(0, 255), (int) random(0, 255));
  progressBar3.show(255, 0, 255, (int) random(0, 255), (int) random(0, 255), (int) random(0, 255));

  iteracion++;
}
