_parent.countStart(10,"up",true);
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_parent.player_type == "cpu")
   {
      _parent.kick13_attack_check();
   }
   if(_parent.inCount == true && _parent.opp.onHit == true && _parent.inFreeze)
   {
      _parent.status_1 = "c3";
      delete this.onEnterFrame;
   }
};
