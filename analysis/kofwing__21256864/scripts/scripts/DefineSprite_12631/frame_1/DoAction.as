this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      stop();
      return undefined;
   }
   play();
   this._y -= 1.2;
};
