var s = _root.role_mc.status_1;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_root.role_mc.status_1 != s)
   {
      this.removeMovieClip();
   }
};
