stop();
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16777215,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "add";
}
var pos_target = Func.lToG(_root.role_mc.opp);
var pos_obj = Func.lToG(this);
area.moveAim_pos(65,pos_obj.x,pos_obj.y,pos_target.x,pos_target.y - 100);
onHit = function()
{
   icebody.stop();
};
onLand = function()
{
   gotoAndStop("hit2");
   play();
};
