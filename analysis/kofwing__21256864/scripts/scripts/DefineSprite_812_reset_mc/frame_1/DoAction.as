_level0.transIn();
_level0.P1_role.bgEff_end();
_level0.P2_role.bgEff_end();
_level0.charToCenter();
_level0.P1_role.stand();
_level0.P2_role.stand();
var arr = ["refresh","life","debug","music"];
var i = 0;
while(i < arr.length)
{
   _level0.menu_bottom_mc.mc["trigger_" + arr[i]]._visible = false;
   i++;
}
_level0.stageControl_mc.stopControl();
_level0.stageControl_mc.startControl();
_level0.shake_mc.shakeStart(0,0,0);
_level0.P1_role.control = false;
_level0.P2_role.control = false;
