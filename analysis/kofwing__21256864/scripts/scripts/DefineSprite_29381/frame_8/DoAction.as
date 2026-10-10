if(_parent.opp.status_1 != "hurt3")
{
   delete this.onEnterFrame;
   gotoAndStop("nohit");
   play();
}
else
{
   continueHit = true;
}
