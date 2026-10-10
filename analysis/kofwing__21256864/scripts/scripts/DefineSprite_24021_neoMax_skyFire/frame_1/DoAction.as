if(_root.role_mc.dir == 1)
{
   this._x = - _level0.char_mc._x;
}
else
{
   this._x = - _level0.char_mc._x + _level0.stage_with;
}
this.blendMode = "screen";
if(_level0.glowMode)
{
   this.blendMode = "add";
}
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
