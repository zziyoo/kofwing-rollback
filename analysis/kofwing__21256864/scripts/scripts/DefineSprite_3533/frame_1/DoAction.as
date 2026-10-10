function showInfo(debugT, lifeNow, acc_dmg, dmg)
{
   debugTarget = debugT;
   this["lifemax_" + debugT].text = totalLife;
   this["txtLifeNow_" + debugT].text = lifeNow;
   this["txtLifeNow_per_" + debugT].text = int(lifeNow / totalLife * 100);
   if(debugT == "p1")
   {
      debugTarget = "p2";
   }
   else
   {
      debugTarget = "p1";
   }
   if(acc_dmg > 0)
   {
      this["txtLastSkill_per_" + debugTarget].text = int((acc_dmg + dmg) / totalLife * 100);
   }
   else
   {
      this["txtLastSkill_per_" + debugTarget].text = int(dmg / totalLife * 100);
   }
}
stop();
_visible = false;
if(_level0.lan == "en")
{
   nextFrame();
}
var debugTarget;
var totalLife = _root.life_max;
showInfo("p1",totalLife,0,0);
showInfo("p2",totalLife,0,0);
