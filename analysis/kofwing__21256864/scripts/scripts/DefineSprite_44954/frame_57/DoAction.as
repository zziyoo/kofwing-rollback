delete this.onEnterFrame;
if(_parent.dir > 0)
{
   _level0.effect_mc.downEff("crash_eff",_parent._x - 25,_parent._y - 75,_parent.opp.dir);
}
else
{
   _level0.effect_mc.downEff("crash_eff",_parent._x + 25,_parent._y - 75,_parent.opp.dir);
}
