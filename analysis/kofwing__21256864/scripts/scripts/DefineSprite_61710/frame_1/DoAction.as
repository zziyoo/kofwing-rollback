function init_time()
{
   gotoAndStop(1);
   continue_time_txt.text = 15;
   timeStart();
}
function timeStart()
{
   clearInterval(time_timer);
   time_timer = setInterval(this,"time_dec",1000);
}
function time_dec()
{
   if(continue_time_txt.text > 0)
   {
      continue_time_txt.text--;
   }
   if(continue_time_txt.text == 0)
   {
      timeStop();
      if(_level0.autoSelectRank)
      {
         stopAllSounds();
         _level0.autoSelectRank = false;
         _parent._parent.removeMovieClip();
         _level0.gotoAndPlay("op");
      }
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
