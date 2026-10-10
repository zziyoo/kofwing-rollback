function init_time()
{
   if(_level0.playTime == -1)
   {
      gotoAndStop(2);
   }
   else
   {
      gotoAndStop(1);
      time_txt.text = _level0.playTime;
   }
}
function timeStart()
{
   clearInterval(time_timer);
   time_timer = setInterval(this,"time_dec",1000);
}
function time_dec()
{
   var _loc2_ = new Color(time_txt);
   if(time_txt.text <= 16)
   {
      _loc2_.setRGB(16711680);
   }
   else
   {
      _loc2_.setRGB(16777215);
   }
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_level0.inFreeze)
   {
      return undefined;
   }
   time_txt.text--;
   if(time_txt.text == 0)
   {
      timeStop();
      _level0.timeOverNotice_snd.start();
      setTimeout(function()
      {
         _level0.timeOut();
         clearInterval(time_timer);
      }
      ,500);
   }
   var _loc1_;
   var _loc3_;
   if(_level0.player_type == "COMVSCOM" && _level0.autoPlayGame)
   {
      _loc1_ = Math.random();
      if(_loc1_ < 0.15)
      {
         _loc1_ = 0.15;
      }
      _loc3_ = _level0.playTime - int(_loc1_ * 100);
      if(time_txt.text <= _loc3_)
      {
         _level0.autoSelectRank = true;
         _level0.autoPlayGameGotoDisplay();
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
