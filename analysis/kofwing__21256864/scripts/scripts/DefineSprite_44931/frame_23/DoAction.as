_parent.checkTouch_stop = true;
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
   }
   if(role.dir > 0 && role._x + _level0.char_mc._x > _level0.stage_with - 150 || role.dir < 0 && role._x + _level0.char_mc._x < 150)
   {
      delete this.onEnterFrame;
      gotoAndStop("att");
      play();
   }
};
