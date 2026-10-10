if(!_level0.inPause)
{
   if(num < numMax)
   {
      gotoAndStop("do");
      play();
   }
   else
   {
      stop();
      var role = _root.role_mc;
      role.kyoPower = false;
      role.burst_mode = "";
      role.inBurst = false;
      role.colorNormal();
      _parent.gotoAndPlay("end");
   }
}
