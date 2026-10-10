stop();
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   this._y = 461;
   this._x = role._x;
   if(role.inBurst != true)
   {
      this.removeMovieClip();
   }
   if(role.status_3 == "hurt" || role.status_3 == "down" || role.status_3 == "" || role.status_2 == "air")
   {
      gotoAndStop(1);
      delete this.onEnterFrame;
   }
};
