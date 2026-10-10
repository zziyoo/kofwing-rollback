if(_level0.inPause)
{
   gotoAndPlay(_currentframe - 1);
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
