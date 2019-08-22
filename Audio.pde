import ddf.minim.*;

class Audio {

  private Minim minim;
  private AudioPlayer audioPlayer;

  Audio(String filename, Object context) {

    this.minim = new Minim(context);
    this.audioPlayer = minim.loadFile(filename);

    return;
  }

  public void play() {
    this.audioPlayer.play();
    return;
  }

  public void pause() {
    this.audioPlayer.pause();
    return;
  }

  public void stop() {
    this.audioPlayer.pause();
    this.audioPlayer.rewind();
    return;
  }
}
