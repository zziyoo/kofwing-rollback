this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_parent.opp.status_7 == "dfo" && _parent.opp.status_3 == "hurt")
   {
      _parent.nobody = true;
      delete this.onEnterFrame;
   }
};
