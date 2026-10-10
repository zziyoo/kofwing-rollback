this.onEnterFrame = function()
{
   if(_root.role_mc.opp._y >= 240)
   {
      delete this.onEnterFrame;
      gotoAndStop("hit");
      play();
   }
};
