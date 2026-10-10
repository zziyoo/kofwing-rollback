_parent.countStart(10,"down",true);
this.onEnterFrame = function()
{
   if(_parent.player_type == "cpu")
   {
      _parent.kick13_attack_check();
   }
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_parent.inCount == true && _parent.opp.onHit == true && _parent.inFreeze)
   {
      _parent.status_1 = "c2";
      delete this.onEnterFrame;
   }
};
