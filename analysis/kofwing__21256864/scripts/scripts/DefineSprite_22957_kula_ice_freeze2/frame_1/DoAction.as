var opp = _root.role_mc.opp;
var role = _root.role_mc;
_X = opp._x;
if(opp.status_3 == "hurt" && role.onHit)
{
   hit = true;
   opp.hurtValue.hurtAway = "aaa";
   opp.stop_hurtBack();
   opp.mc.inIce = true;
   opp.gotoAndStop("hurt1");
   opp.mc.gotoAndStop(2);
   this.onEnterFrame = function()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(opp.hurtValue.hurtAway != "aaa")
      {
         delete this.onEnterFrame;
         gotoAndStop("end");
         play();
         return undefined;
      }
      opp.gotoAndStop("hurt1");
      opp.mc.gotoAndStop(2);
   };
}
