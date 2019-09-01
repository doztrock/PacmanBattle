/**
 * Esta clase se encarga de manejar los archivos de audio.
 *
 * Cada archivo contara con las opciones de play(), pause() y stop(), de modo
 * que puedan ser usadas de manera dinamica durante la ejecucion del programa.
 *
 * Cabe aclarar que para cada audio se debe usar una instancia, ya que no se dejara
 * cambiar la ruta de acceso al fichero.
 *
 */
import ddf.minim.*;

class Audio {

  /**
   * Manejadores
   */
  private Minim minim;
  private AudioPlayer audioPlayer;

  /**
   * Constructor
   *
   * Parametros:  filename -> Nombre del archivo
   *              context  -> Puntero a la clase principal
   *
   */
  Audio(String filename, Object context) {

    this.minim = new Minim(context);
    this.audioPlayer = minim.loadFile(filename);

    return;
  }

  /**
   * Funcion:     play
   *
   * Objetivo:    Reproducir el audio.
   *
   * Parametros:  N/A
   *  
   * Retorno:     N/A
   *
   */
  public void play() {

    if (!this.audioPlayer.isPlaying()) {
      this.audioPlayer.play();
      this.audioPlayer.rewind();
    }

    return;
  }

  /**
   * Funcion:     pause
   *
   * Objetivo:    Pausar el audio.
   *
   * Parametros:  N/A
   *  
   * Retorno:     N/A
   *
   */
  public void pause() {

    if (this.audioPlayer.isPlaying()) {
      this.audioPlayer.pause();
    }

    return;
  }

  /**
   * Funcion:     stop
   *
   * Objetivo:    Detener el audio.
   *
   * Parametros:  N/A
   *  
   * Retorno:     N/A
   *
   */
  public void stop() {

    if (this.audioPlayer.isPlaying()) {
      this.audioPlayer.pause();
      this.audioPlayer.rewind();
    }

    return;
  }
}
