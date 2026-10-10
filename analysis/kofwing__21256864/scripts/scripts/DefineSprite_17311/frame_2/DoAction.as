var pt = new Object();
this._y = _parent.s_y - 445;
pt.x = this._x;
pt.y = this._y;
_parent.localToGlobal(pt);
name = _parent.s_name;
isBlack = _parent.isBlack;
isGrey = _parent.isGrey;
_root.role_mc.addSkill(name,this,Vx,Va,isBlack,isGrey,true);
