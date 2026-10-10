function init_time()
{
   gotoAndStop(1);
   continue_time_txt.text = 60;
   if(_level0.player_type == "COMVSCOM")
   {
      continue_time_txt.text = 3;
   }
   if(_level0.autoPlayGame)
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
   if(_level0.player_type == "COMVSCOM")
   {
      if((Key.isDown(_level0.u) || Key.isDown(_level0.d) || Key.isDown(_level0.f) || Key.isDown(_level0.b)) && continue_time_txt.text <= 3 && continue_time_txt.text > 0)
      {
         if(continue_time_txt.text <= 3 && continue_time_txt.text > 0)
         {
            continue_time_txt.text = 15;
         }
      }
   }
   if(continue_time_txt.text == 0)
   {
      timeStop();
      _level0.ok_snd.start();
      _level0.ok_snd.start();
      _parent.saveOption();
      _parent._parent.play();
      this.removeMovieClip();
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
