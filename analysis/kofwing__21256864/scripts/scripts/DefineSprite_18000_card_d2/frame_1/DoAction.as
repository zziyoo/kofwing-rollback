stop();
var dirs = this.dir;
var pos_obj = Func.lToG(this);
var pos_target = Func.lToG(_root.role_mc.opp);
var pos_target_x = pos_obj.x + 600 * this.dir;
area.moveAim_pos(50,pos_obj.x,pos_obj.y,pos_target_x,_level0.land_Y);
onLand = function()
{
   gotoAndStop("onLand");
   play();
};
onHit = function()
{
   play();
};
