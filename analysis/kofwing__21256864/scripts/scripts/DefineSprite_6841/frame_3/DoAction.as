_level0.shake_mc.shakeStart(1,15);
_level0.effect_mc.downEff("down2",_parent._x,_parent._y,dir);
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze || _root.role_mc.opp.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
