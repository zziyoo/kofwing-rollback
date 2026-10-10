function start()
{
   num = 0;
}
function end()
{
   stop();
   var _loc3_ = _root.role_mc;
   _loc3_.ashPower = false;
   _loc3_.burst_mode = "";
   _loc3_.inBurst = false;
   _loc3_.colorNormal();
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
