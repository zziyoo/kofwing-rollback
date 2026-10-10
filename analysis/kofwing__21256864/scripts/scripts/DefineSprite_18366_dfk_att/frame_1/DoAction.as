this._visible = false;
var s = _root.role_mc.status_1;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      this._x = _root.role_mc.opp._x;
      this._y = _root.role_mc.opp._y;
      if(_root.role_mc.status_1 != s)
      {
         this.removeMovieClip();
      }
      if(_root.role_mc.opp.status_3 == "down" && _root.role_mc.opp.status_7 == "dfk")
      {
         gotoAndStop("att");
         play();
      }
   }
};
