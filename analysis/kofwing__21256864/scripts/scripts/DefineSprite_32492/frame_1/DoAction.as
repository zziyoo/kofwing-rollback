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
if(role.do_hitTest2(this))
{
   role.switchSkill(flag);
}
