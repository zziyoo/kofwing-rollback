p_mc.holdFunc = function()
{
};
p_mc.releaseFunc = function()
{
   if(lh)
   {
      gotoAndStop("attack");
      play();
   }
   else
   {
      gotoAndStop("attack2");
      play();
   }
};
p_mc.endFunc = function()
{
   if(lh)
   {
      gotoAndStop("attack");
      play();
   }
   else
   {
      gotoAndStop("attack2");
      play();
   }
};
