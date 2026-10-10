var shake_v = 5;
var shake_v_max = 40;
var seg = 1;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(seg == 1)
   {
      seg = 2;
      shake_v += 0.5;
      if(shake_v > shake_v_max)
      {
         shake_v = shake_v_max;
      }
      _level0._x = int(Math.random() * shake_v - shake_v / 2);
      _level0._y = shake_v;
   }
   else if(seg == 2)
   {
      seg = 1;
      _level0._x = 0;
      _level0._y = 0;
   }
};
