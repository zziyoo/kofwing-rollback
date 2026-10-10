if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      if(_level0.inPause || _level0.inFreeze)
      {
         return undefined;
      }
      _parent.sk31_s_check();
   };
}
else
{
   var owner = this;
   hold_mc.holdFunc = function()
   {
   };
   hold_mc.releaseFunc = function()
   {
      if(owner._currentframe > 48)
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
