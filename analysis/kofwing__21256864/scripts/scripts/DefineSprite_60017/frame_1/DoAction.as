function con()
{
   _level0.ok_snd.start();
   _parent.type = "continue";
   _parent.play();
}
function main()
{
   _level0.ok_snd.start();
   stopAllSounds();
   _parent.type = "mainMenu";
   _parent.play();
}
stop();
