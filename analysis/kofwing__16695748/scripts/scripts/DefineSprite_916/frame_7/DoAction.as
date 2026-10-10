var owner = this;
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.long_check();
   };
}
else
{
   hold_mc.holdFunc = function()
   {
   };
   hold_mc.releaseFunc = function()
   {
      if(owner._currentframe > 40)
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
      owner.gotoAndPlay("attack2");
   };
}
