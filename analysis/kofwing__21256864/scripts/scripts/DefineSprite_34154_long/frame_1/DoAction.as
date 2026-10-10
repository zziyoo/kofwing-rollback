if(_root.role_mc.dir == 1 && _root.role_mc.opp.dir == -1)
{
   _X = _root.role_mc.opp._x - 200;
}
if(_root.role_mc.dir == -1 && _root.role_mc.opp.dir == 1)
{
   _X = _root.role_mc.opp._x + 200;
}
if(_root.role_mc.dir == _root.role_mc.opp.dir)
{
   _X = _root.role_mc.opp._x - 200 * _root.role_mc.dir;
}
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
