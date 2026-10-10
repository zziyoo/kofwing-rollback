if(_level0.XIIIeff)
{
   gotoAndStop("XIII");
   play();
}
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_root.role_mc.status_3 == "hurt")
   {
      delete this.onEnterFrame();
      this.removeMovieClip();
   }
};
