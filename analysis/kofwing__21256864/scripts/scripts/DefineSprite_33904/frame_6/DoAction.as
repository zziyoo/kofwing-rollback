if(_level0.inPause)
{
   gotoAndPlay(_currentframe - 1);
}
else if(_root.role_mc.status_1 == "ready" || opp.life == _level0.life_max)
{
   end();
}
else if(opp.isKO && opp.status_3 != "hurt" && opp.status_2 == "land")
{
   opp.hurtValue.hurtBack = "hurt2";
   opp.hurtValue.end_status = "getup2";
   opp.hurtValue.Vx = 0;
   opp.hurtValue.Vy = 0;
   opp.toStatus("getup2");
   opp.mc.gotoAndPlay("dizzy");
   opp.hurtBack();
   end();
}
else if(opp.isKO && opp.status_3 != "hurt" && opp.status_2 != "land")
{
   opp.hurtAway();
   end();
}
else if(num < numMax && _root.role_mc.status_3 != "hurt" && !opp.isKO)
{
   gotoAndStop("do");
   play();
}
else
{
   end();
}
