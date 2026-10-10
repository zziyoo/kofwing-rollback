stop();
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(role.inBurst != true)
   {
      gotoAndPlay(1);
      delete this.onEnterFrame;
   }
};
