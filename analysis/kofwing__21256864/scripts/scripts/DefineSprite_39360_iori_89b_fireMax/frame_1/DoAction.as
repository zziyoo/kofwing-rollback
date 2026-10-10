var role = _root.role_mc;
var opp = _root.role_mc.opp;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
      this._x += 18 * this.dir;
   }
   if(this._x + _level0.char_mc._x > 963 || this._x + _level0.char_mc._x < -110)
   {
      this.removeMovieClip();
   }
   if(role.status_3 == "hurt" || role.status_3 == "down" || role.status_3 == "")
   {
      this.removeMovieClip();
   }
};
