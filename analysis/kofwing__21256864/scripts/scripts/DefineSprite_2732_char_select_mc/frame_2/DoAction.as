function selectCharStart()
{
   selectChar.stop();
   selectChar.start(0,100);
   selectChar.onSoundComplete = function()
   {
   };
}
var selectChar = new Sound();
if(_level0.player_type != "COMVSCOM" && _level0.player_type != "1PVSCOM")
{
   selectChar.loadSound("sound/select.mp3",false);
   selectChar.setVolume(_level0.BgmVolume);
}
else if(_level0.SE_old)
{
   selectChar.attachSound("arcadeSelect97");
}
else
{
   selectChar.attachSound("arcadeSelect02um");
}
selectCharStart();
