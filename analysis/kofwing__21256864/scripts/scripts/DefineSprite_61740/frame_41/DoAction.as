function gotoMenu3(dir)
{
   if(dir == "left")
   {
      optionNow--;
   }
   else if(dir == "right")
   {
      optionNow++;
   }
   if(optionNow < 1)
   {
      optionNow = optionAll;
   }
   else if(optionNow > optionAll)
   {
      optionNow = 1;
   }
   if(dir == "up")
   {
      totalOptionNow++;
   }
   else if(dir == "down")
   {
      totalOptionNow--;
   }
   if(totalOptionNow < 1)
   {
      totalOptionNow = totalOption;
   }
   else if(totalOptionNow > totalOption)
   {
      totalOptionNow = 1;
   }
   totalOption--;
   if(_level0.lan == "en")
   {
      mc.gotoAndStop(optionNow + totalOption + dis);
   }
   else
   {
      mc.gotoAndStop(optionNow);
   }
   _level0.select_snd.start();
}
function select3()
{
   if(selectOK3)
   {
      return undefined;
   }
   selectOK3 = true;
   if(optionNow == 1)
   {
      _level0.saveGlow(true);
   }
   else
   {
      _level0.saveGlow(false);
   }
   play();
}
stop();
var optionNow = 1;
var optionAll = 2;
var totalOptionNow = 1;
var totalOption = 2;
var selectOK3 = false;
var dis = 4;
