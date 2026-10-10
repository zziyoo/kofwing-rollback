this._x = Math.random() * 900 - _level0.char_mc._x;
this._y = Math.random() * 660 - 200;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
