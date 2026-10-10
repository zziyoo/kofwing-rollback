var _left = true;
if(_parent.onHit && _parent.opp.status_3 == "hurt")
{
   _level0.charToCenter();
   _level0.zoomControl_mc.zoomIn(_level0.char_mc,_parent,1.35,0.05);
}
else
{
   gotoAndStop("nohit");
   play();
}
