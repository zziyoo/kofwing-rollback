if(_parent.onHit = _parent.opp.status_3 != "hurt" || _parent.opp.status_2 != "land")
{
   gotoAndStop("END");
   play();
   delete this.onEnterFrame;
}
