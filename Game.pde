Audio audioIntro;
Audio audioSiren;

void setup() {

  /* Pantalla */
  size(800, 600);

  /* Audio */
  audioIntro = new Audio("audio/pacman-intro.mp3", Audio.Normal, this);
  audioSiren = new Audio("audio/pacman-siren.mp3", Audio.Loop, this);

  return;
} 

void draw() {

  background(0);

  audioIntro.play();

  if (!audioIntro.running()) {
    audioSiren.play();
  }

  return;
}
