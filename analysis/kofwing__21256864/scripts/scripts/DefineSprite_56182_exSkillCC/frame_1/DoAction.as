this.onEnterFrame = function()
{
   if(_root.role_mc.stopCC || _root.role_mc.isKO || _root.role_mc.opp.isKO)
   {
      _root.role_mc.stopCC = false;
      mc.end();
      _root.role_mc.burst_mode = "";
      _root.role_mc.inBurst = false;
      _root.role_mc.ashPower = false;
   }
};
