if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
role = _parent._parent;
if(Vy != 0)
{
   role.start_move_Y1(Vy,Vx,end_status,Vg);
}
else
{
   role.start_move_X2(Vx);
}
