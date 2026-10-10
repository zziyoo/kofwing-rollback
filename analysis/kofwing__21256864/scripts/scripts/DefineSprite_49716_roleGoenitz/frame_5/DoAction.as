if(opp._roleName == "Orochi" && opp.roleMode == 1)
{
   gotoAndStop("end5");
}
var i = Math.random();
if(i > 0 && i <= 0.25)
{
   gotoAndStop("end1");
}
if(i > 0.25 && i <= 0.5)
{
   gotoAndStop("end2");
}
else if(i > 0.5 && i <= 0.75)
{
   gotoAndStop("end3");
}
else if(i > 0.75)
{
   gotoAndStop("end4");
}
