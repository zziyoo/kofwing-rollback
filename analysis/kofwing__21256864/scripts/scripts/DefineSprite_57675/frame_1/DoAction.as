if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
role = _root.role_mc;
var xx = 10;
var yy = 16;
if(role.hurtValue.Vx < 10)
{
   xx = 5;
   yy = 12;
}
else if(role.hurtValue.Vx < 20)
{
   xx = 10;
   yy = 16;
}
else if(role.hurtValue.Vx < 40)
{
   xx = 15;
   yy = 20;
}
else if(role.hurtValue.Vx < 60)
{
   xx = 20;
   yy = 20;
}
else
{
   xx = 25;
   yy = 20;
}
role.hurtAway_self(xx,yy,end_status);
