dirs = this.dir;
status_1 = "db_p";
if(_root.role_mc.dir == 1 && _root.role_mc.opp.dir == -1)
{
   _X = _root.role_mc.opp._x - 165;
}
if(_root.role_mc.dir == -1 && _root.role_mc.opp.dir == 1)
{
   _X = _root.role_mc.opp._x + 165;
}
if(_root.role_mc.dir == _root.role_mc.opp.dir)
{
   _X = _root.role_mc.opp._x - 165 * _root.role_mc.dir;
}
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze || _root.role_mc.opp.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
allowNum = 1;
