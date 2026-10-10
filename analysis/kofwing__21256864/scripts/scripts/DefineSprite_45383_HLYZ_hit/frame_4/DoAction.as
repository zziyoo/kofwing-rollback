_root.role_mc.twk = true;
if(_root.role_mc.opp._y == 445)
{
   _root.role_mc.opp.status_1 = "hurt1";
   _root.role_mc.opp.status_2 = "land";
   _root.role_mc.opp.status_3 = "hurt";
   _root.role_mc.opp.status_7 = "twk";
   _root.role_mc.opp.gotoAndStop("hurt1");
   _root.role_mc.opp.mc.gotoAndPlay(1);
   _root.timePlay();
}
