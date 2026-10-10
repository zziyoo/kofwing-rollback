if(_level0.inPause)
{
   gotoAndPlay(_currentframe - 1);
}
else if(_root.role_mc.status_1 == "sk_shenwei")
{
   gotoAndStop("do");
   play();
}
else
{
   stop();
   var role = _root.role_mc;
   role.colorNormal();
   _parent.gotoAndPlay("end");
   this.removeMovieClip();
}
