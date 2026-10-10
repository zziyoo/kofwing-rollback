_parent.countEnd();
delete this.onEnterFrame;
_parent.checkTouch_stop = true;
var snd = new Sound(this);
snd.attachSound("defend.wav");
snd.start();
