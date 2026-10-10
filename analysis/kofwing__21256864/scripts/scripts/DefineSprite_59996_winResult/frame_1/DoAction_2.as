function winnerBgmStart()
{
   winnerBgm.stop();
   winnerBgm.start();
   winnerBgm.onSoundComplete = function()
   {
   };
}
var winnerBgm = new Sound();
var changeBgm_rate = Math.random();
if(!_level0.SE_old)
{
   winnerBgm.attachSound("winner02um");
}
else
{
   winnerBgm.attachSound("winner97");
}
winnerBgmStart();
