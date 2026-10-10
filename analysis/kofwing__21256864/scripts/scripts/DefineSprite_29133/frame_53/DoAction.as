if(_parent.onHit && _parent.opp.status_3 == "hurt")
{
   gotoAndStop("hit3");
   play();
   delete this.onEnterFrame;
}
else
{
   gotoAndStop("nohit2");
   play();
   delete this.onEnterFrame;
}
