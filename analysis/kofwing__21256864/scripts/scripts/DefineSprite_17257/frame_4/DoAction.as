role = _root.role_mc;
role._x = _parent.xx;
role._y = 300;
role.status_2 = "air";
role.status_1 = "jump";
role.status_3 = "normal";
role.start_move_Y1(-1,0,"land",3);
role.checkSide_abs();
if(type == "cpu")
{
   role.air_check();
}
