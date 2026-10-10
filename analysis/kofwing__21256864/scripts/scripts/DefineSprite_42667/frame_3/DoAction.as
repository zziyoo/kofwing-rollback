if(_parent.opp.status_1 == "hurt1" || _parent.opp.status_1 == "hurt2" || _parent.opp.status_1 == "hurt3" || _parent.opp.status_1 == "hurt4" || _parent.opp.status_1 == "hurt5")
{
   gotoAndStop("attack");
   play();
}
var owner = this;
hold_mc.holdFunc = function()
{
};
hold_mc.releaseFunc = function()
{
   if(owner._currentframe > 30)
   {
      owner.gotoAndPlay("attack");
   }
};
hold_mc.endFunc = function()
{
};
