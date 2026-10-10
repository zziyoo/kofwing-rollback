_parent.checkSide_abs();
_parent.countStart(1,"all",true);
this.onEnterFrame = function()
{
   if(_parent.inCount == true)
   {
      gotoAndStop("att");
      play();
   }
};
