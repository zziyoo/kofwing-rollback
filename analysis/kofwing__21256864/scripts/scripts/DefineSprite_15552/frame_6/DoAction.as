var owner = this;
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.zljq_check();
   };
}
else
{
   hold_mc.holdFunc = function()
   {
   };
   hold_mc.releaseFunc = function()
   {
      gotoAndStop("attack");
      play();
   };
   hold_mc.endFunc = function()
   {
      gotoAndStop("attack");
      play();
   };
}
