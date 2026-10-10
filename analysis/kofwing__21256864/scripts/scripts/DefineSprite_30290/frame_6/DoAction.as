if(_root.role_mc.player_type == "cpu")
{
   if(_parent.opp.status_3 != "hurt")
   {
      return undefined;
   }
   if(_parent.opp.status_7 != "3d")
   {
      return undefined;
   }
   var i = Math.floor(Math.random() * 10 + 1);
   if(i <= 2)
   {
      _parent.switchSkill("sk1");
   }
   else if(i <= 4)
   {
      _parent.switchSkill("sk0");
   }
   else if(i <= 6)
   {
      _parent.switchSkill("sk28");
   }
   else if(i <= 8)
   {
      _parent.switchSkill("sk30");
   }
   else
   {
      _parent.switchSkill("sk_longche");
   }
}
