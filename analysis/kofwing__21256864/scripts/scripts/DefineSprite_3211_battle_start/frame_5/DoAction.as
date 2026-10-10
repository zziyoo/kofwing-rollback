this.onEnterFrame = function()
{
   if(_level0.IoriStarted == 2)
   {
      delete this.onEnterFrame;
      gotoAndStop("end");
      play();
   }
   else
   {
      gotoAndStop("loop");
      play();
   }
};
