var dx;
var nowx = _X;
if(dir == 1)
{
   dx = _root.role_mc.opp._x - nowx;
}
else
{
   dx = nowx - _root.role_mc.opp._x;
}
this.onEnterFrame = function()
{
   if(dx >= 0)
   {
      if(dir == 1)
      {
         _X = _X + dx / 15;
         if(_X >= _root.role_mc.opp._x)
         {
            _X = _root.role_mc.opp._x;
            delete this.onEnterFrame;
         }
      }
      else
      {
         _X = _X - dx / 15;
         if(_X <= _root.role_mc.opp._x)
         {
            _X = _root.role_mc.opp._x;
            delete this.onEnterFrame;
         }
      }
   }
   else if(dir == 1)
   {
      _X = _X - 5;
   }
   else
   {
      _X = _X + 5;
   }
};
