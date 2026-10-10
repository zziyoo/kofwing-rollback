this.onEnterFrame = function()
{
   if(_parent.inCount == true)
   {
      gotoAndStop("hit");
      play();
   }
};
