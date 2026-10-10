this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      this._x += 35 * this.dir;
      play();
   }
   if(_root.role_mc.status_1 != "sk5_l")
   {
      this.removeMovieClip;
      gotoAndPlay(10);
      delete this.onEnterFrame;
   }
};
