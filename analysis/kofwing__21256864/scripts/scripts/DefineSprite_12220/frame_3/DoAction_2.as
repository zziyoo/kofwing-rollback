key_mc.pressFunc = function()
{
   gotoAndStop("a1");
   play();
};
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      var _loc3_ = Math.random();
      var _loc2_ = 0.1 * _parent.countTimes;
      if(_parent.countTimes < 10 && _loc3_ <= _loc2_)
      {
         gotoAndStop("a1");
         play();
      }
      if(_parent.opp.status_3 == "hurt")
      {
         gotoAndStop("a1");
         play();
      }
   };
}
