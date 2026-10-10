if(_level0.inPause)
{
   gotoAndPlay(_currentframe - 1);
}
else if(role.inBurst)
{
   gotoAndStop("do");
   play();
}
else
{
   stop();
   var role = _root.role_mc;
   role.armor_mode = false;
   role.att_mode = false;
   role.colorNormal();
   _parent.gotoAndPlay("end");
}
