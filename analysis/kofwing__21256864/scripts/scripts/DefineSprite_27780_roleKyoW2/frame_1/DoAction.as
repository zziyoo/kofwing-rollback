stop();
var isRole = true;
var objRoleName = "KyoW2";
if(_level0.player_type == "trainning")
{
   return undefined;
}
if(opp._roleName == "Iori")
{
   gotoAndStop("begin_yagami");
}
else if(opp._roleName == "Ash")
{
   gotoAndStop("begin_ash");
}
