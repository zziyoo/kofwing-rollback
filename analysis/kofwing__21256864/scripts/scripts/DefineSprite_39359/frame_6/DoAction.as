if(_level0.inFreeze || _level0.inPause)
{
   gotoAndPlay(_currentframe - 1);
   return undefined;
}
if(opp.status_7 != "aaa")
{
   gotoAndPlay(_currentframe - 1);
   _root.role_mc.opp.colorNormal();
}
else if(num < numMax)
{
   gotoAndStop("do");
   play();
}
else
{
   stop();
   _root.role_mc.opp.colorNormal();
}
