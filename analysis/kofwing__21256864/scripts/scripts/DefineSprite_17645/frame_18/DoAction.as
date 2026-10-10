if(Key.isDown(_parent.p) || Key.isDown(_parent.p_l))
{
   gotoAndPlay(10);
}
else
{
   _parent.status_6 = "normal";
   gotoAndStop("att");
   play();
}
