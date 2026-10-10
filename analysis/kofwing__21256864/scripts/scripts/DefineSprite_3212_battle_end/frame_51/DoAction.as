if(type == "draw")
{
   setTimeout(function()
   {
      play();
   }
   ,3000);
}
var owner = this;
var frames = 0;
var isEnd = false;
stop();
owner.onEnterFrame = function()
{
   if(_level0.winner.mc._currentframe == frames)
   {
      isEnd = true;
      play();
      delete owner.onEnterFrame;
   }
   frames = _level0.winner.mc._currentframe;
};
setTimeout(function()
{
   if(isEnd == false)
   {
      play();
   }
}
,30000);
