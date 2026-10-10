stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
this.swapDepths(_parent.getNextHighestDepth());
var i = 0;
var num = 0;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   i++;
   if(i == intvalFrame)
   {
      i = 0;
      num++;
      if(num == numMax)
      {
         if(lastObj != "")
         {
            name = lastObj;
         }
         _root.role_mc.addSkill(name,this);
         delete this.onEnterFrame;
         this.removeMovieClip();
      }
      _root.role_mc.addSkill(name,this);
   }
};
