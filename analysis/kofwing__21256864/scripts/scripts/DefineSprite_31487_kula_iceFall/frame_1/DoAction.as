stop();
_xscale = _yscale = int(Math.random() * 50) + 20;
var pos_obj = Func.lToG(this);
var pos_target = Func.lToG(_root.role_mc.opp);
move_mc.moveAim_pos(40,pos_obj.x,pos_obj.y,pos_target.x,pos_target.y - Math.random() * 200);
var owner = this;
move_mc.onLand = function()
{
   owner.gotoAndPlay("hit");
};
