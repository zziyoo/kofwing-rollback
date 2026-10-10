this.onEnterFrame = function()
{
   if(_root.role_mc.onHit == true && _root.role_mc.opp.status_3 == "hurt")
   {
      _X = _root.role_mc.opp._x;
   }
   else if(dir == 1)
   {
      _X = _X + 380;
   }
   else
   {
      _X = _X - 380;
   }
   delete this.onEnterFrame;
};
