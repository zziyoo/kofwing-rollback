var opp = _root.role_mc.opp;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   opp.gotoAndStop("hurt2");
   opp.mc.gotoAndStop("s_catch");
   if(opp.status_1 != "hurt2")
   {
      delete this.onEnterFrame;
      gotoAndStop("end");
      play();
      return undefined;
   }
   this._x = opp._x;
   this._y = opp._y - 150;
};
