stop();
var isRole = true;
var objRoleName = "KyoW";
if(_level0.player_type == "trainning")
{
   return undefined;
}
var i = Math.random();
if(opp._roleName == "Iori" && opp.roleMode != 3)
{
   if(_level0.ran == 0)
   {
      gotoAndStop("begin_yagami99");
   }
   else if(_level0.ran == 1)
   {
      gotoAndStop("begin_yagami00");
   }
   else
   {
      gotoAndStop("begin_yagami01");
   }
}
else if(opp._roleName == "K")
{
   gotoAndStop("begin_k");
}
else if(i < 0.5)
{
   gotoAndStop("begin2");
}
