function start()
{
   num = 0;
}
onEnterFrame = function()
{
   if(_level0.debug == true)
   {
      _visible = true;
   }
   else
   {
      _visible = false;
   }
};
var num = 0;
this.onUnload = function()
{
   if(num < numMax)
   {
      _root.role_mc.opp.colorNormal();
   }
};
