if(_parent.onHit && _parent.opp.status_3 == "hurt")
{
   gotoAndStop("hit2");
   play();
   play();
   delete this.onEnterFrame;
}
else if(_parent.opp.status_3 != "hurt")
{
   gotoAndStop("nohit");
   play();
   play();
   delete this.onEnterFrame;
}
