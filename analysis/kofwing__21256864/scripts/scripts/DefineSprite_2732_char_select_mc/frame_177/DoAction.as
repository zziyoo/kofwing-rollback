function selectCharArcadeStart()
{
   selectCharArcade.stop();
   selectCharArcade.start();
   selectCharArcade.onSoundComplete = function()
   {
   };
}
var selectCharArcade = new Sound();
if(_level0.SE_old)
{
   selectCharArcade.attachSound("arcadeSelect97");
}
else
{
   selectCharArcade.attachSound("arcadeSelect02um");
}
selectCharArcadeStart();
