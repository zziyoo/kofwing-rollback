_parent.checkTouch_stop = true;
_level0.zoomControl_mc.zoomIn(_level0.char_mc,_root.role_mc,1.5,0.5);
if(_root.role_mc.opp.status_3 == "hurt" && _root.role_mc.opp.status_2 == "air")
{
   gotoAndStop("hitair");
   play();
}
