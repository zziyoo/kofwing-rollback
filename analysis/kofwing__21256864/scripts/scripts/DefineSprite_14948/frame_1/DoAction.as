stop();
this._visible = 0;
role = _root.role_mc;
dir = _root.role_mc.dir;
dx = role._x + this._x * dir;
dy = role._y + this._y;
_level0.effect_mc.superStart(s_type,f_time,dx,dy,bgType,roleName,dir,this,role);
