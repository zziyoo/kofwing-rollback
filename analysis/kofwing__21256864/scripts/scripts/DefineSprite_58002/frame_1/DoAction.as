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
var isBlack = _isBlack;
var isGrey = _isGrey;
if(_root.role_mc.roleMode == 1)
{
   isBlack = false;
   isGrey = false;
}
_root.role_mc.addSkill(name,this,Vx,Va,isBlack,isGrey);
