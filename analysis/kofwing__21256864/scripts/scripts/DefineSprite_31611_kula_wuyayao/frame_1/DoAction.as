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
      this.removeMovieClip();
   }
};
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16777215,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "add";
}
