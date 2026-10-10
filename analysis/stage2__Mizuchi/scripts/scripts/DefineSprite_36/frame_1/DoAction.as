this.onEnterFrame = function()
{
   if(snow._y >= -172)
   {
      snow._y = -1000;
   }
   else
   {
      snow._y += 3;
   }
};
