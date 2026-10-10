if(!(_root.role_mc.onHit == true && (_root.role_mc.opp.status_1 == "hold_u" || _root.role_mc.opp.status_1 == "hold_d" || _root.role_mc.opp.inCount)))
{
   _root.role_mc.mc.gotoAndPlay("attack");
}
this.onEnterFrame = function()
{
   if(!_level0.inPause)
   {
      this._x += 62 * _root.role_mc.dir;
   }
};
