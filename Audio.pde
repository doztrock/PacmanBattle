import ddf.minim.*;

class Audio {

  private String filename;
  private Minim minim;
  private AudioPlayer audioPlayer;

  Audio(String filename) {

    this.setFilename(filename);

    this.minim= new Minim(this);
    this.audioPlayer = this.minim.loadFile(this.getFilename());

    return;
  }

  public void setFilename(String filename) {
    this.filename = filename;
    return;
  }

  public String getFilename() {
    return this.filename;
  }

  public void play() {
    this.audioPlayer.play();
    return;
  }

  public void pause() {
    this.audioPlayer.pause();
    return;
  }

  public void rewind() {
    this.audioPlayer.rewind();
    return;
  }
}
