function start()
{
   num = 0;
}
function end()
{
   stop();
   opp.colorNormal();
   _parent.gotoAndPlay("end");
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
var opp = _root.role_mc.opp;
this.onUnload = function()
{
   if(num < numMax)
   {
      _root.role_mc.opp.colorNormal();
   }
};
