if(_root.role_mc.opp.status_7 != "panzi")
{
   gotoAndStop("explode");
   play();
}
if(_root.role_mc.opp.status_7 == "panzi" && _root.role_mc.opp.status_4 == "hold")
{
   gotoAndStop("explode2");
   play();
}
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
