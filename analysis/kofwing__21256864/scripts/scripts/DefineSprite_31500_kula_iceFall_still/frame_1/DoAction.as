var pos_target = Func.lToG(_root.role_mc.opp);
var pos_obj = Func.lToG(this);
area.moveAim_pos(1,pos_obj.x,pos_obj.y,pos_target.x,pos_target.y - 50);
onHit = function()
{
   gotoAndStop("hit");
   play();
};
onLand = function()
{
   gotoAndStop("hit");
   play();
};
