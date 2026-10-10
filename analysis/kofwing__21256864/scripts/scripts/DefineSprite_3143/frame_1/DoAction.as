function setPos()
{
   if(_on)
   {
      btn._x = 54;
      btn.gotoAndStop(2);
      _on = false;
      _parent[_offFunc](_on);
   }
   else if(!_on)
   {
      btn._x = -54;
      btn.gotoAndStop(1);
      _on = true;
      _parent[_onFunc](_on);
   }
}
function setPos2()
{
   if(!_on)
   {
      btn._x = 54;
      btn.gotoAndStop(2);
      _on = false;
      _parent[_offFunc](_on);
   }
   else if(_on)
   {
      btn._x = -54;
      btn.gotoAndStop(1);
      _on = true;
      _parent[_onFunc](_on);
   }
}
if(!_on)
{
   btn.gotoAndStop(2);
   btn._x = 54;
}
if(_init == "")
{
   _on = true;
   setPos2();
}
else
{
   _on = _parent[_init]();
   setPos2();
}
btn.onPress = function()
{
   if(_enable)
   {
      btn.startDrag(false,-54,0,54,0);
   }
};
btn.onRelease = function()
{
   if(_enable)
   {
      btn.stopDrag();
      setPos();
   }
};
