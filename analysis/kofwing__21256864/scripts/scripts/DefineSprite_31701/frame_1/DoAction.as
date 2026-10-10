this.onEnterFrame = function()
{
   normal.stop();
   XIII.stop();
   if(_level0.XIIIeff)
   {
      XIII.play();
   }
   else
   {
      normal.play();
   }
};
