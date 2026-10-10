_parent.countStart(1,"up");
var owner = this;
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.check_hold_bdb_p_ex();
   };
}
else
{
   hold_mc.holdFunc = function()
   {
   };
   hold_mc.releaseFunc = function()
   {
      owner.gotoAndPlay("hit");
   };
   hold_mc.endFunc = function()
   {
      owner.gotoAndPlay("hit");
   };
}
