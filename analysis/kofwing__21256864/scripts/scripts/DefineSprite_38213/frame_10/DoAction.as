if(_parent.onHit && _parent.opp.status_3 == "hurt")
{
   gotoAndStop("hit2");
   play();
   delete this.onEnterFrame;
}
else if(_parent.opp.status_3 != "hurt")
{
   gotoAndStop("nohit");
   play();
   delete this.onEnterFrame;
}
else if(_parent.onHit && _parent.opp.status_2 != "air")
{
}
