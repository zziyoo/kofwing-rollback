delete this.onEnterFrame;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
      this._x = _root.role_mc.opp._x;
      this._y = _root.role_mc.opp._y;
      if(_root.role_mc.opp.status_3 == "down" && _root.role_mc.opp.status_7 == "dfk")
      {
         gotoAndStop("att");
         play();
      }
   }
};
