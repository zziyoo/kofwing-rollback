this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   if(this._currentframe % 2 == 0)
   {
      _parent.opp._x += 5;
   }
   else
   {
      _parent.opp._x -= 5;
   }
};
var objs = _root.role_mc.getObjs();
var i = 0;
while(i < objs.length)
{
   if(objs[i].isRole == true)
   {
      objs[i].removeMovieClip();
      objs[i].pop();
   }
   i++;
}
