function catchOK()
{
   gotoAndStop("s2");
   play();
}
continueHit = true;
if(_parent._y >= 415)
{
   jumped = true;
   _parent._y = 415;
}
