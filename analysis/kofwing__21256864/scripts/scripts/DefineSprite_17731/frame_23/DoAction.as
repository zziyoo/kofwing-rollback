Vx = 40;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(inFreeze)
   {
      return undefined;
   }
   _parent.do_move(_parent.dir * Vx);
   Vx -= 2;
   if(Vx <= 0)
   {
      delete this.onEnterFrame;
   }
};
