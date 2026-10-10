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
if(!role.ashPower)
{
   this.removeMovieClip();
   return undefined;
}
dir = _root.role_mc.dir;
dx = role._x + this._x * dir;
dy = role._y + this._y;
f_time = 0;
bgType = null;
var s_type;
if(_level0.XIIIeff)
{
   s_type = "s_defend";
}
else
{
   s_type = "s_attack";
}
_level0.effect_mc.superStart(s_type,f_time,dx,dy,bgType,roleName,dir,this,role);
