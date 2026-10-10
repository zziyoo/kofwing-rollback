var owner = this;
hold_mc.holdFunc = function()
{
};
hold_mc.releaseFunc = function()
{
   owner.gotoAndPlay("attack");
};
hold_mc.endFunc = function()
{
   owner.gotoAndPlay("attack2");
};
