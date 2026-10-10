function hit()
{
   play();
}
dirs = this.dir;
allowNum = 1;
this.onEnterFrame = function()
{
   if(_root.role_mc.opp.isKO)
   {
      delete this.onEnterFrame;
      gotoAndStop("explode");
      play();
   }
};
