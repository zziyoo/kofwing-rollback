_X = _root.role_mc.opp._x;
_Y = _root.role_mc._y;
_root.role_mc.ballObj = this;
onEnterFrame = function()
{
   if(_level0.inPause)
   {
      stop();
      return undefined;
   }
   if(_level0.inFreeze)
   {
      stop();
      return undefined;
   }
   play();
};
if(_root.role_mc.opp._y >= 445 || _root.role_mc.opp.status_2 == "land")
{
   if(_root.role_mc.opp.status_2 == "air" && (_root.role_mc.opp.status_3 == "normal" || _root.role_mc.opp.status_3 == "attack"))
   {
      _root.role_mc.opp.gotoAndStop("land");
      _root.role_mc.opp.stop_move_Y1();
   }
   _root.role_mc.opp.control = false;
   _root.role_mc.opp.mc.stop();
   _root.role_mc.opp.stop_hurtBack();
   _root.role_mc.opp.status_now.stop();
   _root.role_mc.opp._y = 445;
   _root.role_mc.opp.status_3 = "hurt";
   _root.role_mc.opp.status_7 = "twk";
   _root.role_mc.twk = true;
   _root.role_mc.onHit = true;
   _parent.opp.mc.stop();
   _level0.timeStop();
}
