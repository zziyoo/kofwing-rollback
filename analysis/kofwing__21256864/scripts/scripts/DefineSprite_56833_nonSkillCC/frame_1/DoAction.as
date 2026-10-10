this.onEnterFrame = function()
{
   if(_root.role_mc.isKO || _root.role_mc.opp.isKO)
   {
      mc.end();
   }
};
