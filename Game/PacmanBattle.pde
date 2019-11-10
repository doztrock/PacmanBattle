class PacmanBattle {

  /* Plataforma */
  public static final int ARDUINO   = (1 << 0);
  public static final int PC        = (1 << 1); 
  public static final int PLATFORM  = ARDUINO;

  /* Velocidad de transmision */
  public static final String PORT   = "/dev/ttyACM0";
  public static final int BAUD_RATE = 9600;

  /** Instrucciones: Lectura */
  public static final char LEFT_CONTROL_1   = '7';
  public static final char LEFT_CONTROL_2   = '8';

  public static final char UP_CONTROL_1     = '9';
  public static final char UP_CONTROL_2     = 'A';

  public static final char DOWN_CONTROL_1   = 'B';
  public static final char DOWN_CONTROL_2   = 'C';

  public static final char RIGHT_CONTROL_1  = 'D';
  public static final char RIGHT_CONTROL_2  = 'E';

  public static final char SHOOT_CONTROL_1  = 'F';
  public static final char SHOOT_CONTROL_2  = 'G';

  public static final char SWITCH_CONTROL_1 = 'H';
  public static final char SWITCH_CONTROL_2 = 'I';

  /** Instrucciones: Escritura */
  public static final char VIBRATE_CONTROL_1 = 'J';
  public static final char VIBRATE_CONTROL_2 = 'K';

}
