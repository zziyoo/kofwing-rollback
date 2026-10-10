var opp = _root.role_mc.opp;
var role = _root.role_mc;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(opp.hurtValue.hurtAway != "aaa")
   {
      delete this.onEnterFrame;
      _root.role_mc.opp.colorChange("normal");
      gotoAndStop("end");
      play();
   }
};
