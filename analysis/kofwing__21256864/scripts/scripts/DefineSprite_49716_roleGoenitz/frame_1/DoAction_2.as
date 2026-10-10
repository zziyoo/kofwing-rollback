var i = Math.random();
if(opp._roleName == "Orochi" && opp.roleMode == 1)
{
   gotoAndStop("begin4");
}
else if(i > 0.3 && i <= 0.6)
{
   gotoAndStop("begin2");
}
else if(i > 0.6)
{
   gotoAndStop("begin3");
}
