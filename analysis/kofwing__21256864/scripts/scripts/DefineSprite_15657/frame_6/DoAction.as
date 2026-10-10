holdMc.holdFunc = function()
{
};
holdMc.releaseFunc = function()
{
   if(this._currentFrame > 47)
   {
      gotoAndStop("attack2");
      play();
   }
   else
   {
      gotoAndStop("attack");
      play();
   }
};
holdMc.endFunc = function()
{
   gotoAndStop("attack2");
   play();
};
