class Message {

  private void log(String content) {
    println(content);
  }

  public void information(String content) {
    this.log("[INFO]: " + content);
  }

  public void warning(String content) {
    this.log("[WARN]: " + content);
  }

  public void error(String content) {
    this.log("[ERROR]: " + content);
  }

}
