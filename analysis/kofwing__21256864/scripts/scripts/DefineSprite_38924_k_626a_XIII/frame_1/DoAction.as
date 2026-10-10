this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      stop();
   }
   else
   {
      play();
   }
};
if(!_level0.XIIIeff)
{
   this._visible = false;
   delete this.onEnterFrame;
   stop();
   this.removeMovieClip();
}
if(_level0.glowMode)
{
   if(_level0.glowType)
   {
      this.blendMode = "hardlight";
   }
   else
   {
      this.blendMode = "add";
   }
}
