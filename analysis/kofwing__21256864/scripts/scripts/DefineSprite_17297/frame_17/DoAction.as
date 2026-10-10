delete this.onEnterFrame;
Vx = 35;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
      return undefined;
   }
   play();
   if(_parent.player_type == "cpu")
   {
      _parent.hei_check();
   }
   _parent.do_move(_parent.dir * Vx);
   Vx -= 1.5;
   if(Vx <= 0)
   {
      delete this.onEnterFrame;
   }
};
_level0.run_snd.stop();
_parent.combo_check();
