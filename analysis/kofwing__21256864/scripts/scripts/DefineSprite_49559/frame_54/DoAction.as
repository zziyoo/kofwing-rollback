if(_level0.inPause)
{
   gotoAndPlay(_currentframe - 1);
}
else if(num >= 10)
{
   gotoAndStop("END");
   play();
}
else
{
   num++;
   gotoAndStop("hit1");
   play();
}
