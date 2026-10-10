var opp = _root.role_mc.opp;
var role = _root.role_mc;
if((opp.status_3 == "hurt" || opp.status_3 == "") && opp.status_7 == "aaa")
{
   hit = true;
   opp.status_7 = "aaa";
   opp.stop_hurtBack();
   opp.mc.in89b = true;
   opp.gotoAndStop("hurt2");
   opp.mc.gotoAndStop(2);
   _X = _root.role_mc.opp._x;
   _Y = 445;
   this.onEnterFrame = function()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(_root.role_mc.status_1 == "ready")
      {
         gotoAndPlay(92);
      }
      if(opp.status_7 != "aaa" || opp.mc.catched)
      {
         _X = _root.role_mc.opp._x;
         _Y = _root.role_mc.opp._y;
         delete this.onEnterFrame;
         gotoAndStop("end");
         play();
         return undefined;
      }
      _X = _root.role_mc.opp._x;
      _Y = _root.role_mc.opp._y;
      opp.gotoAndStop("hurt2");
      opp.mc.gotoAndStop(2);
   };
}
