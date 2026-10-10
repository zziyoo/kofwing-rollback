if(!_level0.XIIIeff)
{
   this._visible = false;
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
