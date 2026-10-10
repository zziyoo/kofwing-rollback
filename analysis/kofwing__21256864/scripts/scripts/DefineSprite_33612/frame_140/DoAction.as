delete this.onEnterFrame;
_parent.opp.checkTouch_stop = false;
_parent.checkTouch_stop = false;
if(opp.inBurst)
{
   opp.powerObj.action = "burstdec";
   opp.powerObj.decNum = 80;
   opp.powerControl(opp.powerObj);
}
else if(_parent == _level0.P1_role && _level0.LP_P2.powerPoint_num == 0)
{
   _level0.LP_P2.powerBar_mc.point_mc.gotoAndStop(0);
   _level0.LP_P2.powerBar_mc.gotoAndStop(0);
   _level0.LP_P2.power_now = 0;
}
else if(_parent == _level0.P2_role && _level0.LP_P1.powerPoint_num == 0)
{
   _level0.LP_P1.powerBar_mc.point_mc.gotoAndStop(0);
   _level0.LP_P1.powerBar_mc.gotoAndStop(0);
   _level0.LP_P1.power_now = 0;
}
else
{
   opp.powerObj.action = "dec";
   opp.powerControl(opp.powerObj);
}
_parent.opp.mc.play();
continueHit = false;
opp.lifeObj.d_rate = 0.4;
opp.lifeControl(opp.lifeObj);
