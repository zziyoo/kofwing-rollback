if(Key.isDown(_parent.p) || Key.isDown(_parent.p_l))
{
   gotoAndPlay(14);
}
else
{
   _parent.status_6 = "normal";
   gotoAndStop("att");
   play();
}
