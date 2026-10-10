var powerObj;
powerObj.inc = 5;
powerObj.action = "inc";
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(superPoint == powerPoint_max)
   {
      delete this.onEnterFrame;
      gotoAndStop("stop");
      play();
   }
   _parent.powerControl(powerObj);
};
Key.addListener(this);
this.onKeyUp = function()
{
   if(Key.getCode() == _parent.s)
   {
      delete this.onEnterFrame;
      gotoAndStop("stop");
      play();
   }
};
