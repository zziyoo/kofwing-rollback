stop();
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16777215,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
}
var pos_target = Func.lToG(_root.role_mc.opp);
_X = _root.role_mc._x;
var pos_obj = Func.lToG(this);
area.moveAim_pos(60,pos_obj.x,pos_obj.y,pos_target.x,pos_target.y - 50);
onHit = function()
{
   icebody.stop();
};
onLand = function()
{
   gotoAndStop("hit");
   play();
};
