if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.check_buyue_re();
   };
}
else
{
   keyp.pressFunc = function()
   {
      gotoAndStop("end");
      play();
   };
}
