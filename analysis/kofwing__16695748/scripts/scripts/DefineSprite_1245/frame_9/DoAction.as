if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.long_check_re();
   };
}
else
{
   keyp2.pressFunc = function()
   {
      gotoAndStop("end");
      play();
   };
}
