hits++;
if(hits >= 12)
{
   gotoAndStop("explode");
   play();
}
else if(hits >= 11)
{
   gotoAndStop("hitEnd");
   play();
}
else if(vx > 10)
{
   gotoAndStop("hit1");
}
else if(vx > 8)
{
   gotoAndStop("hit2");
}
else if(vx > 6)
{
   gotoAndStop("hit3");
}
else if(vx > 4)
{
   gotoAndStop("hit4");
}
else if(vx > 2)
{
   gotoAndStop("hit5");
}
else
{
   gotoAndStop("hit6");
}
