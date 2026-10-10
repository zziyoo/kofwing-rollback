stop();
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   _X = _X + 35 * _root.role_mc.dir;
   _Y = _Y + 30;
   if(_Y > 535)
   {
      this.gotoAndPlay("hit");
   }
};
