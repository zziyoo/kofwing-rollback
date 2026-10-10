stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
role = _root.role_mc;
this.onEnterFrame = function()
{
   if(this.hitTest(role.opp.mc.body) && role.opp.status_3 != "down")
   {
      delete this.onEnterFrame;
      if(role.roleMode == 2)
      {
         _parent.gotoAndPlay(flag2);
      }
      else
      {
         _parent.gotoAndPlay(flag);
      }
      return undefined;
   }
   if(flag == undefined)
   {
      delete this.onEnterFrame;
   }
};
