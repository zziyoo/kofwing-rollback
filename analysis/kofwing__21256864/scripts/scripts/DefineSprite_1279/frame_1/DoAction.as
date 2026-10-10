function init_time()
{
   gotoAndStop(1);
   continue_time_txt.text = 60;
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
      _level0.ok_snd.start();
      _parent._parent.type = "no";
      _parent._parent.play();
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
