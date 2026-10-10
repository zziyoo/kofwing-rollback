if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
role = _root.role_mc;
var _Vx;
if(role.roleMode == 2)
{
   if(Vx_d == 0)
   {
      _Vx = Vx;
   }
   else
   {
      _Vx = Vx_d;
   }
}
else
{
   _Vx = Vx;
}
role.start_move_X1(_Vx,this);
