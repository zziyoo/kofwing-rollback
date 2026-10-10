stop();
var isRole = true;
var objRoleName = "Rugal";
if(opp._roleName == "Orochi" && opp.roleMode == 1)
{
   gotoAndStop("begin-orochi");
}
if(opp._roleName == "Kyo" && opp.roleMode == 1)
{
   gotoAndStop("begin-kyo");
}
if(opp._roleName == "Goenitz")
{
   gotoAndStop("begin-goenitz");
}
var i = Math.random();
if(i > 0.5)
{
   gotoAndStop("begin2");
}
