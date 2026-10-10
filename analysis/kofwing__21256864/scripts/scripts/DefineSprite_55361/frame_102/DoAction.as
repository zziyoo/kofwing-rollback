delete this.onEnterFrame;
this.onEnterFrame = function()
{
   if(mc1._y < -165 && mc1._y > -155)
   {
      delete this.onEnterFrame;
   }
   counter++;
   mc1._x += (-25 - mc1._x) / 10;
   mc1._y += (-160 - mc1._y) / 10;
   mc2._x += (-25 - mc2._x) / 10;
   mc2._y += (-160 - mc2._y) / 10;
};
