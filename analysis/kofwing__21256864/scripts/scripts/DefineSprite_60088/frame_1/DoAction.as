function init_time()
{
   gotoAndStop(1);
   continue_time_txt.text = 145;
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
      _parent.go();
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
