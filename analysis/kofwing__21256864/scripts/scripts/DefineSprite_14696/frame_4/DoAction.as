var owner = this;
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      if(_level0.inPause || _level0.inFreeze)
      {
         return undefined;
      }
      _parent.fbdf_p_EX_check();
   };
}
else
{
   hold_mc.holdFunc = function()
   {
   };
   hold_mc.releaseFunc = function()
   {
      if(owner._currentframe > 49)
      {
         owner.gotoAndPlay("attack4");
      }
      else if(owner._currentframe > 24)
      {
         owner.gotoAndPlay("attack3");
      }
      else if(owner._currentframe > 23 && _parent.opp.status_3 == "hurt" && _parent.onHit == true)
      {
         owner.gotoAndPlay("attack5");
      }
      else
      {
         owner.gotoAndPlay("attack2");
      }
   };
   hold_mc.endFunc = function()
   {
      owner.gotoAndPlay("attack4");
   };
}
