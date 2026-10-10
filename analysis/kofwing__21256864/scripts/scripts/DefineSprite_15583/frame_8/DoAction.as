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
      owner.gotoAndPlay("attack");
   };
   hold_mc.endFunc = function()
   {
      owner.gotoAndPlay("attack");
   };
}
