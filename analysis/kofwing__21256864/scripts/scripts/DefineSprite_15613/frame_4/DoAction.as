var owner = this;
hold_mc.holdFunc = function()
{
};
hold_mc.releaseFunc = function()
{
   if(owner._currentframe > 40)
   {
      owner.gotoAndPlay("attack3");
   }
   else if(owner._currentframe > 25)
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
   owner.gotoAndPlay("attack3");
};
