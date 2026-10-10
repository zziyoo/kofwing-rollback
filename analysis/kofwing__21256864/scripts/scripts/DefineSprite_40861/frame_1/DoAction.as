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
role.catch_HitTest(this,status_1,flag,land,hurt,downHit,superMoveEff,visibility,changeDir);
