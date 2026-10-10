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
this._visible = 0;
var role = _root.role_mc;
var opp = role.opp;
var onHit;
checkCounter();
