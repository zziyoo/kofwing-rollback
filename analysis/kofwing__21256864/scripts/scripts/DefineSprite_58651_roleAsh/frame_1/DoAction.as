stop();
var isRole = true;
var objRoleName = "Ash";
var stopCC = false;
if(_level0.player_type == "trainning")
{
   return undefined;
}
if(opp._roleName == "Iori" && opp.roleMode != 3 && roleMode == 1)
{
   gotoAndStop("begin_Iori");
}
if(opp._roleName == "KyoW" && opp.roleMode == 2 && roleMode == 1)
{
   gotoAndStop("begin_KyoW");
}
