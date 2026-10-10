if(_parent.role == "" || _parent.canSelect == false)
{
   stop();
   _visible = false;
   return undefined;
}
if(_root._framesloaded >= _parent.frameOK)
{
   stop();
   _visible = false;
   _parent.loadOK = true;
   _root.roleLoaded++;
}
if(_parent._currentframe == 1 && _parent.active && _parent.loadOK)
{
   _parent.gotoAndStop(_parent.role);
}
