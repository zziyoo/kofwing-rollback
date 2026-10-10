var opp = _root.role_mc.opp;
var role = _root.role_mc;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
      return undefined;
   }
   play();
   _X = _root.role_mc.opp._x;
   if(opp.status_7 != "aaa")
   {
      delete this.onEnterFrame;
      _root.role_mc.opp.colorNormal(true);
      gotoAndStop("end");
      play();
   }
};
