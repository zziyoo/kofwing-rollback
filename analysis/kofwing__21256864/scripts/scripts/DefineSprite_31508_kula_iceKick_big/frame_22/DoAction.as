stop();
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16777215,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "add";
}
var pos_obj = Func.lToG(this);
var pos_target = {x:pos_obj.x + 600 * _root.role_mc.dir,y:pos_obj.y - 100};
area.moveAim_pos(45,pos_obj.x,pos_obj.y,pos_target.x,pos_target.y);
var owner = this;
move_mc.onLand = function()
{
   owner.gotoAndPlay("hit2");
};
