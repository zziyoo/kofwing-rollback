_parent.countStart(2,"all",true,false);
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_parent.inCount)
   {
      delete this.onEnterFrame;
      _parent.status_6 = "normal";
      gotoAndStop("att");
      play();
   }
};
