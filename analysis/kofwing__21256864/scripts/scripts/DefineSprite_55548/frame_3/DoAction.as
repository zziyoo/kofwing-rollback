this.onEnterFrame = function()
{
   if(_root.role_mc._x >= _root.role_mc.opp._x && _root.role_mc.dir == 1 || _root.role_mc._x <= _root.role_mc.opp._x && _root.role_mc.dir == -1)
   {
      delete this.onEnterFrame;
      gotoAndStop("second");
      play();
   }
};
