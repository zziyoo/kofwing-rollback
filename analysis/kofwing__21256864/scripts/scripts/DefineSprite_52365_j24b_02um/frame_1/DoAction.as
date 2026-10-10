this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   this._y += 25;
   if(dir == 1)
   {
      this._x += 25;
   }
   else
   {
      this._x -= 25;
   }
   if(this._y >= 300)
   {
      gotoAndStop("frame_land");
      play();
      delete this.onEnterFrame;
   }
};
