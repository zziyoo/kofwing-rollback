delete this.onEnterFrame;
_parent.topLayer();
var role = _root.role_mc;
var xx = role._x;
if(role.dir > 0 && role.opp._x + _level0.char_mc._x > 800)
{
   xx = role.opp._x + 60 * role.opp.dir;
}
else if(role.dir < 0 && role.opp._x + _level0.char_mc._x <= 60)
{
   xx = role.opp._x + 60 * role.opp.dir;
}
else
{
   xx = role.opp._x - 60 * role.opp.dir;
}
