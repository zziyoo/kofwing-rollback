var opp = _root.role_mc.opp;
_X = opp._x;
_Y = opp._y - 100;
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16737792,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "add";
}
