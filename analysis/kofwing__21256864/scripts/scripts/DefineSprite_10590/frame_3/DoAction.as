var owner = this;
hold_mc.holdFunc = function()
{
};
hold_mc.releaseFunc = function()
{
   if(owner._currentframe > 30)
   {
      owner.gotoAndPlay("att_pofang");
   }
   else
   {
      owner.gotoAndPlay("att1");
   }
};
hold_mc.endFunc = function()
{
   owner.gotoAndPlay("att_pofang");
};
