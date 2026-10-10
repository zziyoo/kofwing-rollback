keyp.pressFunc = function()
{
   if(_root.role_mc.opp.status_3 == "hurt")
   {
      _root.role_mc.status_1 = "jump_Skill_punch_s";
      gotoAndStop("punch_s");
      play();
   }
};
