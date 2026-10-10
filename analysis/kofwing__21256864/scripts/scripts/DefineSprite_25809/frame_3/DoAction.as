_parent.countStart(1,"all",false,false);
var owner = this;
mc.holdFunc = function()
{
};
mc.releaseFunc = function()
{
   if(this.currentFrame > 34)
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
mc.endFunc = function()
{
   gotoAndStop("attack2");
   play();
};
