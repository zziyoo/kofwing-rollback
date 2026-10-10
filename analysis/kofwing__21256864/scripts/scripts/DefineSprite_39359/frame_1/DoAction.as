function start()
{
   num = 0;
}
stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var num = 0;
var opp = _root.role_mc.opp;
var role = _root.role_mc;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(opp.status_3 == "hurt" && role.onHit)
   {
      play();
      delete this.onEnterFrame;
   }
};
