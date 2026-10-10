role = _root.role_mc;
if(role.dir < 0 && role._x + _level0.char_mc._x > _level0.stage_with - 150 || role.dir > 0 && role._x + _level0.char_mc._x < 150)
{
   if(role.dir == 1)
   {
      role.do_move(50);
   }
   else
   {
      role.do_move(-50);
   }
}
