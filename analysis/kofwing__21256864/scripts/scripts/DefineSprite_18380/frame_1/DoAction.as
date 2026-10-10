stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var role = _root.role_mc;
var opp = role.opp;
if(defendSuper == false)
{
   if(opp.superSkill || opp.inBurstSkill)
   {
      return undefined;
   }
}
if(hitt == true)
{
   if(role.do_hitTest(this) && _root.role_mc.opp.status_3 == "hurt")
   {
      _parent.gotoAndPlay(flag);
   }
}
else if(role.do_hitTest(this))
{
   _parent.gotoAndPlay(flag);
}
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(hitt == true)
   {
      if(role.do_hitTest(this) && _root.role_mc.opp.status_3 == "hurt")
      {
         _parent.gotoAndPlay(flag);
      }
   }
   else if(role.do_hitTest(this))
   {
      _parent.gotoAndPlay(flag);
   }
};
