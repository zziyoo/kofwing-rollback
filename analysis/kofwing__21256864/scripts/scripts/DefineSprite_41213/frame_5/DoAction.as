var owner = this;
hold_mc.holdFunc = function()
{
};
hold_mc.releaseFunc = function()
{
   if(owner._currentframe > 48)
   {
      owner.gotoAndPlay("attack");
   }
   else
   {
      owner.gotoAndPlay("attack");
   }
};
hold_mc.endFunc = function()
{
};
