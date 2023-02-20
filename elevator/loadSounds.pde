//Sound
SoundFile underwaterSound;
SoundFile fireSound;
SoundFile explosionDeep;

void loadSounds(){
  //Sound
  underwaterSound = new SoundFile(this, "sound/underwater.wav");
  fireSound = new SoundFile(this, "sound/fire.wav");
  explosionDeep = new SoundFile(this, "sound/explosionDeep.wav");
}
