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
   * Constantes de tipo
   */
  public static final int Normal	= (1 << 0);
  public static final int Loop 	  = (1 << 1);

  /**
   * Manejadores
   */
  private Minim minim;
  private AudioPlayer audioPlayer;

  /**
   * Tipo de audio
   */
  private int type;

  /**
   * Bandera
   */
  private boolean playing = false;

  /**
   * Constructor
   *
   * Parametros:  filename -> Nombre del archivo
   *              context  -> Puntero a la clase principal
   *
   */
  Audio(String filename, int type, PApplet context) {

    this.minim = new Minim(context);
    this.audioPlayer = minim.loadFile(filename);

    this.type = type;

    return;
  }

  /**
   * Funcion:     play
   *
   * Objetivo:    Reproducir el audio dependiendo del tipo.
   *
   * Parametros:  N/A
   *  
   * Retorno:     N/A
   *
   */
  public void play() {

    switch(this.type) {

    case Normal:

      if (!this.audioPlayer.isPlaying() && this.playing == false) {
        this.audioPlayer.play();
        this.playing = true;
      }

      break;

    case Loop:

      if (!this.audioPlayer.isPlaying()) {
        this.audioPlayer.loop();
      }

      break;
    }

    return;
  }

  /**
   * Funcion:     running
   *
   * Objetivo:    Determinar si el audio se esta ejecutando.
   *
   * Parametros:  N/A
   *  
   * Retorno:     TRUE si el audio se esta ejecutando, FALSE en caso contrario.
   *
   */
  public boolean running() {

    if (this.type == Loop) {
      return true;
    }

    return this.audioPlayer.isPlaying();
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
