var owner = this;
hold_mc.holdFunc = function()
{
};
hold_mc.releaseFunc = function()
{
   if(owner._currentframe > 50)
   {
      owner.gotoAndPlay("attack2");
   }
   else
   {
      owner.gotoAndPlay("attack");
   }
};
hold_mc.endFunc = function()
{
   if(owner._currentframe > 50)
   {
      owner.gotoAndPlay("attack2");
   }
   else
   {
      owner.gotoAndPlay("attack");
   }
};
