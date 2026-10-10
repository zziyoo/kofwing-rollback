function start()
{
   num = 0;
}
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var num = 0;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
};
this.onUnload = function()
{
   if(num < numMax)
   {
      _root.role_mc.opp.colorNormal();
   }
};
