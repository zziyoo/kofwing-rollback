var dirs = this.dir;
var role = _root.role_mc;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      stop();
   }
   else
   {
      play();
   }
   _X = role._x - 40;
   _Y = role._y - 150;
   if(role.status_3 == "hurt")
   {
      this.removeMovieClip();
   }
};
