stop();
this._visible = 0;
role = _root.role_mc;
if(role.do_hitTest(this))
{
   role.switchSkill(flag);
}
