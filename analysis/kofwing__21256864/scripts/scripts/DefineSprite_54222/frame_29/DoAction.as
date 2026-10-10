delete this.onEnterFrame;
_root.role_mc._y = _root.role_mc.opp._y;
_root.role_mc._x = _root.role_mc.opp._x - 60 * _root.role_mc.opp.dir;
removeMovieClip(this.abcd_f);
_level0.charToCenter();
if(_parent.opp.dir == 1)
{
   _parent.start_move_Y1(_parent.opp.Vy,_parent.opp.Vx);
}
else
{
   _parent.start_move_Y1(_parent.opp.Vy,- _parent.opp.Vx);
}
