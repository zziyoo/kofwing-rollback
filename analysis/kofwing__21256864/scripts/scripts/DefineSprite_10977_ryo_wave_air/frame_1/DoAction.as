function hit()
{
   gotoAndStop("hit");
   play();
}
stop();
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(65535,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   if(_level0.glowType)
   {
      this.blendMode = "hardlight";
   }
   else
   {
      this.blendMode = "add";
   }
}
allowNum = 1;
this.onEnterFrame = function()
{
   if(_level0.inPause || _root.role_mc.opp.status_7 == "zd")
   {
      return undefined;
   }
   if(_root.role_mc.opp.status_1 == "getup1")
   {
      delete this.onEnterFrame;
      gotoAndStop(2);
   }
   else if(_root.role_mc.opp.status_1 == "getup2")
   {
      delete this.onEnterFrame;
      gotoAndStop(3);
   }
};
