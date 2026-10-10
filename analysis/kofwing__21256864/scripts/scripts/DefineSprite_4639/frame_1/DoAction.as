_visible = false;
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var num = soundArray.length;
var id = int(Math.random() * num);
var soundName = soundArray[id];
if(soundName == "none")
{
   return undefined;
}
var sound_snd = new Sound(this);
sound_snd.attachSound(soundName);
sound_snd.start(startPos,loop);
