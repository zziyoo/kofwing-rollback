if(_root.role_mc.opp.status_7 != "twk" && _root.role_mc.onHit == false || _root.role_mc.opp._y != 445)
{
   _root.timePlay();
   _root.role_mc.opp.status_7 = "normal";
   _root.role_mc.twk = false;
   _root.role_mc.opp.control = true;
   this.removeMovieClip();
}
else if(_root.role_mc.status_3 == "hurt")
{
   gotoAndStop("hurt");
   play();
}
else
{
   _root.role_mc.opp.control = false;
   _root.role_mc.opp.mc.stop();
   _root.role_mc.opp.status_now.stop();
   _root.role_mc.opp._y = 445;
   _parent.opp.mc.stop();
   if(_root.role_mc.opp.status_2 == "air")
   {
      gotoAndStop("land");
   }
   _root.role_mc.opp.status_3 = "hurt";
}
