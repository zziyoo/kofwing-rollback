function shadowEffect(mc, param)
{
   var _loc5_ = this;
   var _loc7_ = _loc5_.getNextHighestDepth();
   var _loc6_ = new flash.display.BitmapData(mc._width,mc._height,true,0);
   var _loc4_ = mc.getBounds(mc);
   var _loc8_ = new flash.geom.Matrix(1,0,0,1,- _loc4_.xMin,- _loc4_.yMin);
   _loc6_.draw(mc,_loc8_,param.colorTransform);
   _loc5_.mc.removeMovieClip();
   _loc5_.createEmptyMovieClip("mc",_loc7_);
   var _loc3_ = _loc5_.mc;
   _loc3_._xscale = mc._xscale;
   _loc3_._yscale = mc._yscale;
   _loc3_.attachBitmap(_loc6_,_loc7_);
   _loc3_._x = mc._x + _loc4_.xMin * (mc._xscale > 0 ? 1 : -1);
   _loc3_._y = mc._y + _loc4_.yMin;
}
role = _root.role_mc;
var colors;
colors = new flash.geom.ColorTransform();
colors.redOffset = 0;
colors.greenOffset = 0;
colors.blueOffset = 0;
if(isTime == true)
{
   this.onEnterFrame = function()
   {
      shadowEffect(role.opp.mc,{colorTransform:colors});
   };
}
else
{
   shadowEffect(role.opp.mc,{colorTransform:colors});
}
