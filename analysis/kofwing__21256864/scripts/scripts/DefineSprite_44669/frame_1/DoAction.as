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
var onHit;
if(role.inCount && opp.status_3 == "attack")
{
   onHit();
   _parent.gotoAndPlay(flag);
}
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(role.inCount && opp.status_3 == "attack")
   {
      onHit();
      _parent.gotoAndPlay(flag);
      delete this.onEnterFrame;
   }
};
