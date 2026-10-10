function gotoMenu4(dir)
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
   if(_level0.lan == "en")
   {
      mc.gotoAndStop(optionNow + dis);
   }
   else
   {
      mc.gotoAndStop(optionNow);
   }
   _level0.select_snd.start();
}
function select4()
{
   if(selectOK4)
   {
      return undefined;
   }
   selectOK4 = true;
   if(optionNow == 1)
   {
      _level0.saveCounter(true);
      _level0.saveBGM(true);
   }
   else
   {
      _level0.saveCounter(false);
      _level0.saveBGM(false);
   }
   play();
}
stop();
var optionNow = 1;
var optionAll = 2;
var selectOK4 = false;
var dis = 2;
