this.onEnterFrame = function()
{
   if(_parent.player_type == "cpu")
   {
      _parent.hei_check();
   }
   if(_parent.dir == 1 && _parent.opp._x - _parent._x < 120 || _parent.dir == -1 && _parent._x - _parent.opp._x < 120)
   {
      delete this.onEnterFrame;
      gotoAndStop("hit");
      play();
   }
};
_level0.run_snd.start();
