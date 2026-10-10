role = _root.role_mc;
if(role.dir < 0 && role._x + _level0.char_mc._x > _level0.stage_with - 50 || role.dir > 0 && role._x + _level0.char_mc._x < 50)
{
   if(role.dir == 1)
   {
      role.do_move(50);
      role.opp.do_move(50);
   }
   else
   {
      role.do_move(-50);
      role.opp.do_move(-50);
   }
}
_parent.opp.topLayer();
