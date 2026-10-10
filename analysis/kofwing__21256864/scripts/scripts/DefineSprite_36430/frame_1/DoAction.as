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
this.onUnload = function()
{
   if(_root.role_mc.inBurst == false)
   {
      _root.role_mc.opp.colorNormal();
   }
};
