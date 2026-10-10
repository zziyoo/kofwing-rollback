role = _root.role_mc;
opp = role.opp;
continueHit = true;
if(opp.countObj == false)
{
   opp.countEnd();
}
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(opp.countObj == false)
   {
      opp.countEnd();
   }
   if(role.status_7 == "dfk" && opp.status_1 == "hurt")
   {
      delete opp.onEnterFrame;
      opp.stop();
      opp.mc.stop();
      opp.hurtAway();
      delete this.onEnterFrame;
   }
};
