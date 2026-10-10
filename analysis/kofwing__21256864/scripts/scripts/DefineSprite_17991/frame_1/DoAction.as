stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var pt = new Object();
pt.x = this._x;
pt.y = this._y;
_parent.localToGlobal(pt);
var dirs = _parent.dirs;
_root.role_mc.addSkill_os(name,this,Vx,Va,dirs);
