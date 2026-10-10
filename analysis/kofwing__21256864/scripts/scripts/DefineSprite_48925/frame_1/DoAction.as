_parent.checkTouch_stop = true;
var _loc2_ = _parent._x + this._x * _parent.dir;
var m = 30;
if(_parent.dir == -1 && _loc2_ < _parent.egde_min + m)
{
   _parent._x += m;
   _parent.opp._x = _parent._x - m;
}
if(_parent.dir == 1 && _loc2_ > _parent.egde_max - m)
{
   _parent._x -= m;
   _parent.opp._x = _parent._x + m;
}
