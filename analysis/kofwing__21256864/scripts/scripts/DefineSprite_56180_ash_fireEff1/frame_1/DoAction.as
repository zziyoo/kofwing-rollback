this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   this.swapDepths(_parent.getNextHighestDepth());
};
if(!(_root.role_mc.roleMode == 2 || _root.role_mc.eAsh))
{
   this.blendMode = "screen";
   return undefined;
}
var matrix = new Array(0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0);
var greyFilter = new flash.filters.ColorMatrixFilter(matrix);
var filterArray = new Array();
filterArray.push(greyFilter);
this.filters = filterArray;
this.blendMode = "subtract";
