var counter = 0;
this.onEnterFrame = function()
{
   if(mc1._y < -280.5 && mc1._y > -270.5)
   {
      delete this.onEnterFrame;
   }
   counter++;
   mc1._x += (-50 - mc1._x) / 10;
   mc1._y += (-275.5 - mc1._y) / 10;
   mc2._x += (-50 - mc2._x) / 10;
   mc2._y += (-275.5 - mc2._y) / 10;
};
