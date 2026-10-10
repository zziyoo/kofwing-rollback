function hit()
{
   play();
}
allowNum = 1;
dirs = this.dir;
var counter = 0;
var timer = 350;
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
   counter++;
   if(counter >= timer || _root.role_mc.opp.isKO)
   {
      delete this.onEnterFrame;
      gotoAndStop("hit");
      play();
   }
};
