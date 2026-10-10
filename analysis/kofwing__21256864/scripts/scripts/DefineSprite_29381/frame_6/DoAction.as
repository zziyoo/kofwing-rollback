if(_parent.opp.status_7 != "shenchen" || _parent.onHit == false || _parent.opp.status_3 != "hurt" || _parent.opp.status_2 != "land")
{
   gotoAndStop("nohit");
   play();
   delete this.onEnterFrame;
}
