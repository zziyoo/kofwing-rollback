if(_level0.inPause)
{
   gotoAndPlay(_currentframe - 1);
}
else if(num < numMax)
{
   gotoAndStop("do");
   play();
}
else
{
   stop();
   var role = _root.role_mc;
   role.bloodPower = false;
   role.countEnd();
   role.burst_defend = false;
   role.burst_mode = "";
   role.inBurst = false;
   role.colorNormal();
   role.Vwalk = 11;
   role.Vdash = 28;
   role.Vjump_x = 13;
   role.Vjump_y = 39;
   role.Vjump_far = 20;
   _parent.gotoAndPlay("end");
}
