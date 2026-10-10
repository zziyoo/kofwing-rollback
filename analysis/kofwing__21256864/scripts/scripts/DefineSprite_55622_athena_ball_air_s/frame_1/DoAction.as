this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(this._y >= 300)
   {
      gotoAndStop("frame_land");
      play();
      delete this.onEnterFrame;
   }
};
