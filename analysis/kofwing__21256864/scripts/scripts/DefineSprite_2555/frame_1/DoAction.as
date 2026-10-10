function init_time()
{
   gotoAndStop(1);
   continue_time_txt.text = 5;
   if(_level0.autoPlayGame)
   {
      continue_time_txt.text = 0;
   }
   if(_level0.P1_type == "cpu" && _level0.P2_type == "cpu")
   {
      continue_time_txt.text = 0;
   }
   if(_level0.player_type != "trainning")
   {
      timeStart();
   }
   else
   {
      continue_time_txt._visible = false;
      continue_time_name._visible = false;
   }
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
   else
   {
      timeStop();
      _parent.mode2_mc1.selectOK_mode();
      _parent.mode2_mc2.selectOK_mode();
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
