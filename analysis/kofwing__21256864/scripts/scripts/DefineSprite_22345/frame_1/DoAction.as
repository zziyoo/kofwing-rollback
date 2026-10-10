if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
if(_root.role_mc.opp.status_7 != hitID)
{
   _parent.gotoAndPlay(nohitFrame);
}
if(_root.role_mc.opp.status_3 != "hurt")
{
   _parent.gotoAndPlay(nohitFrame);
}
