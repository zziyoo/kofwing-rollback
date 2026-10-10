delete this.onEnterFrame;
var objs = _root.role_mc.opp.getObjs();
var i = 0;
while(i < objs.length)
{
   if(objs[i].isRole == true)
   {
      objs[i].removeMovieClip();
   }
   i++;
}
