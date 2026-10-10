if(_root.role_mc.dir > 0 && _root.role_mc._x <= _root.role_mc.opp._x)
{
   _root.role_mc._x = _root.role_mc.opp._x - 100;
}
else if(_root.role_mc.dir < 0 && _root.role_mc._x >= _root.role_mc.opp._x)
{
   _root.role_mc._x = _root.role_mc.opp._x + 100;
}
else
{
   gotoAndStop("nohit2");
   play();
}
