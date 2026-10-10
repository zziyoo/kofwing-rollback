role = _root.role_mc;
if(role.dir < 0 && role._x + _level0.char_mc._x > _level0.stage_with - 200 || role.dir > 0 && role._x + _level0.char_mc._x < 200)
{
   if(role.dir == 1)
   {
      role.do_move(200);
      role.opp.do_move(200);
   }
   else
   {
      role.do_move(-200);
      role.opp.do_move(-200);
   }
}
