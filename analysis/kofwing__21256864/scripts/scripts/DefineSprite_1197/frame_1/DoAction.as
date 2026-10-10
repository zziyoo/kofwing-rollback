function init_time()
{
   gotoAndStop(1);
   continue_time_txt.text = 10;
   if(_level0.autoPlayGame || _level0.player_type == "COMVSCOM")
   {
      continue_time_txt.text = 3;
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
   if(continue_time_txt.text <= 0)
   {
      timeStop();
      _level0.ok_snd.start();
      _parent.initFaceName();
      _parent.order1P_1.gotoAndStop("num1");
      _parent.order1P_2.gotoAndStop("num2");
      _parent.order1P_3.gotoAndStop("num3");
      if(!(_level0.player_type == "1PVSCOM" && ((_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8) && _level0.moreVs == true && _level0.moreVs3V3 != true || (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && _level0.moreVs3V3 == true)))
      {
         _parent.order2P_1.gotoAndStop("num1");
         _parent.order2P_2.gotoAndStop("num2");
         _parent.order2P_3.gotoAndStop("num3");
      }
      _parent.gotoAndPlay("continue");
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
