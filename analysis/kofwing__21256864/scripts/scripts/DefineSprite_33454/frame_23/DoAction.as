tx.blendMode = "add";
this.blendMode = "add";
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
   if(_root.role_mc.status_3 == "hurt")
   {
      this.removeMovieClip();
   }
};
if(_level0.glowMode)
{
   this.blendMode = "handlight";
   tx.blendMode = "handlight";
}
