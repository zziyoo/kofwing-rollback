stop();
var isRole = true;
var objRoleName = "Iori2";
if(_level0.player_type == "trainning")
{
   return undefined;
}
if(opp._roleName == "KyoW" && opp.roleMode == 1)
{
   if(_level0.ran == 0)
   {
      gotoAndStop("begin_kyo99");
   }
   else if(_level0.ran == 1)
   {
      gotoAndStop("begin_kyo00");
   }
   else
   {
      gotoAndStop("begin_kyo01");
   }
}
if(opp._roleName == "Kyo")
{
   gotoAndStop("begin_kyo98");
}
if(opp._roleName == "Ash" && opp.roleMode == 1)
{
   gotoAndStop("beginOrochi");
}
if(opp._roleName == "KyoW" && opp.roleMode == 2)
{
   gotoAndStop("beginW");
}
