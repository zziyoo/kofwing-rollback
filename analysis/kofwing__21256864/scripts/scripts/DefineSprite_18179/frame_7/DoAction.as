if(_level0.inPause)
{
   gotoAndPlay(_currentframe - 1);
}
else if(num > 3)
{
   play();
}
else
{
   num++;
   gotoAndStop("hit");
   play();
}
