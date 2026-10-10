function checkCounter()
{
   if(role.inCount && opp.status_3 == "attack")
   {
      delete this.onEnterFrame;
      onHit();
      waitFrame();
   }
   this.onEnterFrame = function()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(role.inCount && opp.status_3 == "attack")
      {
         delete this.onEnterFrame;
         onHit();
         waitFrame();
      }
   };
}
function waitFrame()
{
   if(freeze == false)
   {
      _parent.gotoAndPlay(flag);
      return undefined;
   }
   this.onEnterFrame = function()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(role.inFreeze == false)
      {
         _parent.gotoAndPlay(flag);
         delete this.onEnterFrame;
      }
   };
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
var role = _root.role_mc;
var opp = role.opp;
var onHit;
checkCounter();
