function gotoMode3(action)
{
   if(roleMode == 3)
   {
      gotoAndStop(action + "3");
   }
}
stop();
var isRole = true;
var objRoleName = "Krizalid";
if(_level0.player_type == "trainning")
{
   return undefined;
}
if(opp._roleName == "Igniz" || opp._roleName == "K" || opp._roleName == "Nameless")
{
   gotoAndStop("kcnz");
}
var i = Math.random();
if(i > 0.5)
{
   gotoAndStop("2");
}
