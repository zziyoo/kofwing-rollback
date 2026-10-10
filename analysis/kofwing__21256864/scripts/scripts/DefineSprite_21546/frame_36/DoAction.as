if(Key.isDown(_parent.f) || Key.isDown(_parent.b) && !catched)
{
   if(_parent.opp.status_2 == "air" && Math.abs(_parent.opp._y - _parent._y) < 100 && Math.abs(_parent.opp._x - _parent._x) < 150)
   {
      if(_parent.inRecord)
      {
         _parent.skill_record("airThrow");
      }
      gotoAndStop("airThrow");
      play();
      _parent.status_3 = "attack";
      _parent.status_1 = "airThrow";
      if(_parent.player_type == "player")
      {
         _parent.skill_last = _parent.skill_last0;
         _parent.skill_last0 = _parent.status_1;
         _parent.skillToEqual(_parent.skill_last0);
      }
      else
      {
         _parent.skill_last = _parent.skill_now;
         _parent.skill_now = _parent.status_1;
         _parent.skillToEqual(_parent.skill_now);
      }
   }
}
