this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_parent.opp.status_1 == "hurt4" && _parent.onHit == true)
   {
      delete this.onEnterFrame;
      _parent.status_1 = "ao";
   }
};
