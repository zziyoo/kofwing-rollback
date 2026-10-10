if(_level0.inPause || _level0.inFreeze)
{
   gotoAndPlay(_currentframe - 1);
}
else if(num > 8)
{
   play();
}
else
{
   num++;
   gotoAndStop("hit");
   play();
}
