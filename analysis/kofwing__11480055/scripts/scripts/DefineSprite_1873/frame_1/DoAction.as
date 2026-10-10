if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
role = _root.role_mc;
if(Vy != 0)
{
   role.start_move_Y1(Vy,Vx,end_status,Vg);
}
else
{
   role.start_move_X2(Vx);
}
