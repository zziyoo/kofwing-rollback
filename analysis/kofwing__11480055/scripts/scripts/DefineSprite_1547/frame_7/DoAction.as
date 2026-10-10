_level0.k_snd.start();
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_parent.onHit == true)
   {
      _parent.status_1 = "ff";
      if(_parent.player_type == "cpu")
      {
         _parent.checkDash_pl();
      }
      else
      {
         delete this.onEnterFrame;
      }
   }
};
