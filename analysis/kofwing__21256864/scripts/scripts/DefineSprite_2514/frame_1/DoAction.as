function init_time()
{
   gotoAndStop(1);
   continue_time_txt.text = 40;
   if(_level0.player_type == "COMVSCOM")
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
   if(_level0.player_type == "COMVSCOM")
   {
      if((Key.isDown(_level0.u) || Key.isDown(_level0.d) || Key.isDown(_level0.f) || Key.isDown(_level0.b)) && continue_time_txt.text <= 3 && continue_time_txt.text > 0)
      {
         _level0.canSelect = true;
         continue_time_txt.text = 20;
      }
   }
   var _loc2_ = new Color(continue_time_txt);
   if(continue_time_txt.text <= 5)
   {
      _loc2_.setRGB(16711680);
   }
   else
   {
      _loc2_.setRGB(16777215);
   }
   if(continue_time_txt.text > 0)
   {
      continue_time_txt.text--;
   }
   if(continue_time_txt.text <= 1)
   {
      _level0.canSelect = false;
   }
   if(continue_time_txt.text == 0)
   {
      timeStop();
      if(_level0.moreVs3V3 == true)
      {
         _parent.select_mc.player.selectOK();
         setTimeout(function()
         {
            _parent.select_mc.player.selectOK();
         }
         ,500);
         setTimeout(function()
         {
            _parent.select_mc.player.selectOK();
         }
         ,1000);
         if(_level0.player_type != "1PVSCOM")
         {
            setTimeout(function()
            {
               _parent.select_mc2.player.selectOK();
            }
            ,1500);
            setTimeout(function()
            {
               _parent.select_mc2.player.selectOK();
            }
            ,2000);
            setTimeout(function()
            {
               _parent.select_mc2.player.selectOK();
            }
            ,2500);
         }
      }
      else if(_level0.moreVs == true)
      {
         _parent.select_mc.player.selectOK();
         setTimeout(function()
         {
            _parent.select_mc.player.selectOK();
         }
         ,500);
         if(_level0.player_type != "1PVSCOM")
         {
            setTimeout(function()
            {
               _parent.select_mc2.player.selectOK();
            }
            ,1000);
            setTimeout(function()
            {
               _parent.select_mc2.player.selectOK();
            }
            ,1500);
         }
      }
      else
      {
         _parent.select_mc.player.selectOK();
         if(_level0.player_type != "1PVSCOM")
         {
            setTimeout(function()
            {
               _parent.select_mc2.player.selectOK();
            }
            ,500);
         }
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
