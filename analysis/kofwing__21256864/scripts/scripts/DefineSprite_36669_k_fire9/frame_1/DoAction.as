if(_level0.glowMode && !_level0.XIIIeff)
{
   var filter = new flash.filters.GlowFilter(16737792,1,10,10,0.75,3,false,false);
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
var pos_obj = Func.lToG(this);
var pos_target = Func.lToG(_root.role_mc.opp);
var pos_target_x = pos_obj.x + 200 * _root.role_mc.dir;
area.moveAim_pos(80,pos_obj.x,pos_obj.y,pos_target_x,_level0.land_Y);
onLand = function()
{
   gotoAndStop("hit");
   play();
};
onHit = function()
{
   gotoAndStop("hit2");
   play();
};
