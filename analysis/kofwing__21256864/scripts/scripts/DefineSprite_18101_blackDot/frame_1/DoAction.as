dirs = this.dir;
this._visible = false;
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(0,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   if(_level0.glowMode)
   {
      this.blendMode = "hardlight";
   }
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
      if(this._x + _level0.char_mc._x > 863 || this._x + _level0.char_mc._x < -10)
      {
         this.removeMovieClip();
      }
   }
};
