stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
role = _root.role_mc;
land = true;
hurt = false;
role.catch_HitTest(this,status_1,flag,land,hurt,downHit);
