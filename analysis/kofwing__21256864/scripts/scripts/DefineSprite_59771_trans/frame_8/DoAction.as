stop();
onTransIn();
setTimeout(function()
{
   if(_level0.isTransIn == true)
   {
      gotoAndStop("out");
      play();
   }
}
,3000);
