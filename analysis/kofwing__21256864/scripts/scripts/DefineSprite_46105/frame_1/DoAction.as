if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
if(_root.role_mc.opp.status_3 != "hurt" || _root.role_mc.opp.status_1 == "hurt6")
{
   _parent.gotoAndPlay(nohitFrame);
}
