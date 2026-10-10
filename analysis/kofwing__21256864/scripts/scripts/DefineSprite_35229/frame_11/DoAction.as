delete this.onEnterFrame;
if(opp.status_7 == "dfk" && opp.status_3 == "hurt")
{
   gotoAndStop("hit4");
   play();
}
else
{
   gotoAndStop("nohit");
   play();
}
