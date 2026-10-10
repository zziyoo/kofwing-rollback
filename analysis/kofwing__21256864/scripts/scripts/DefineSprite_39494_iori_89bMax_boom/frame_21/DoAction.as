var opp = _root.role_mc.opp;
var role = _root.role_mc;
if((opp.status_3 == "hurt" || opp.status_3 == "") && opp.status_7 == "bbb")
{
   hit = true;
   opp.status_7 = "aaa";
   opp.stop_hurtBack();
   opp.gotoAndStop("hurt2");
   opp.mc.gotoAndStop(2);
   opp.mc.in89b = true;
   this.onEnterFrame = function()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(_root.role_mc.status_1 == "ready")
      {
         gotoAndPlay(89);
      }
      if(opp.status_7 != "aaa" || opp.mc.catched)
      {
         delete this.onEnterFrame;
         opp.status_5 = "89bEnd";
         gotoAndStop("end");
         play();
         return undefined;
      }
      opp.gotoAndStop("hurt2");
      opp.mc.gotoAndStop(2);
   };
}
else
{
   this.onEnterFrame = function()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      status_7 = "jingling";
   };
}
