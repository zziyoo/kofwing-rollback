hold_mc.releaseFunc = function()
{
   if(owner._currentframe >= 28)
   {
      owner.gotoAndPlay("att0");
   }
   else
   {
      owner.gotoAndPlay("att");
   }
};
hold_mc.endFunc = function()
{
};
