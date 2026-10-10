stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var objs = _root.role_mc.getObjs();
var i = 0;
while(i < objs.length)
{
   objs[i].allowNum = 0;
   i++;
}
