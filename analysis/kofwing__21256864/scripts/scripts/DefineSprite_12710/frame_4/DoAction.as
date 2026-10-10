var atk = false;
var opp = _root.role_mc.opp;
if(_parent.opp.status_3 == "attack")
{
   if(opp.comboClass.skill_over[opp.status_1] > 0)
   {
      if(opp.mc._currentframe < opp.comboClass.skill_over[opp.status_1])
      {
         atk = true;
      }
   }
   else if(opp.mc._currentframe < opp.mc._totalframes - 6)
   {
      atk = true;
   }
}
