if(_level0.XIIIeff)
{
   gotoAndStop("XIII");
   play();
}
stop();
mc.stop();
if(_level0.glowMode)
{
   var filter = new flash.filters.GlowFilter(16777215,1,10,10,0.75,3,false,false);
   var filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   this.blendMode = "add";
}
_xscale = _yscale = int(Math.random() * 40) + 20;
var pos_obj = Func.lToG(this);
var pos_target = {x:pos_obj.x + 600 * _root.role_mc.dir,y:pos_obj.y - int(Math.random() * 200 - 100)};
area.moveAim_pos(60,pos_obj.x,pos_obj.y,pos_target.x,pos_target.y);
onLand = function()
{
   mc.play();
   gotoAndStop("hit");
   play();
};
