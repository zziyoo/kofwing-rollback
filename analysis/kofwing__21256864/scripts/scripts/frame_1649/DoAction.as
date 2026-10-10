function checkImport()
{
   if(_currentframe >= _framesloaded)
   {
      charSelect_mc.removeMovieClip();
      gotoAndStop("vs");
      play();
   }
}
var roleImport = 1;
checkImport();
