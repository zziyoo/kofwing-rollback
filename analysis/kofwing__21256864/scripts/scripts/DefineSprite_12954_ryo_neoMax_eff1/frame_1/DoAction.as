this.blendMode = "screen";
if(_level0.glowMode)
{
   this.blendMode = "add";
}
if(this.dir == 1)
{
   this._x = 350 - _level0.char_mc._x;
}
else
{
   this._x = 513 - _level0.char_mc._x;
}
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.freeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
