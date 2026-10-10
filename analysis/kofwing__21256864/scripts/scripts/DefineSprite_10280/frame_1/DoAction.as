if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
if(_root.role_mc.onHit != true || _root.role_mc.opp.status_3 != "hurt")
{
   _parent.gotoAndPlay(nohitFrame);
}
