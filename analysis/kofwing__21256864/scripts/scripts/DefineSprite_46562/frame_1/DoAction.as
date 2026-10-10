stop();
this._visible = false;
var pt = new Object();
pt.x = this._x;
pt.y = this._y;
_parent.localToGlobal(pt);
_root.role_mc.addSkill(name,this,Vx,Va);
