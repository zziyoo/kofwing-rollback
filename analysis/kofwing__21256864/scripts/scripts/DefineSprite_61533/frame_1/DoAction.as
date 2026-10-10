function init_time()
{
   gotoAndStop(1);
   continue_time_txt.text = 30;
   timeStart();
}
function timeStart()
{
   clearInterval(time_timer);
   time_timer = setInterval(this,"time_dec",1000);
}
function time_dec()
{
   continue_time_txt.text--;
   if(continue_time_txt.text == 0)
   {
      timeStop();
      if(_level0.showMoreMsg == true)
      {
         _level0.autoPlayGame = true;
         _level0.moreVs3V3 = true;
         _level0.moreVs = true;
      }
      else
      {
         _level0.autoPlayGame = false;
      }
      _parent.startGame();
   }
}
function timeOut()
{
}
function timeStop()
{
   clearInterval(time_timer);
}
stop();
var time_timer;
init_time();
