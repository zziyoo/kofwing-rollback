stop();
var pos_target = Func.lToG(_root.role_mc.opp);
var pos_obj = Func.lToG(this);
area.moveAim_pos(50,pos_obj.x,pos_obj.y,pos_target.x,pos_target.y - 150);
onLand = function()
{
   play();
};
onHit = function()
{
   play();
};
