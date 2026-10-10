this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(_parent.opp.countObj == false)
   {
      _parent.opp.countEnd();
   }
};
