function showHint(f)
{
   _visible = true;
   gotoAndStop(f);
}
stop();
_visible = false;
btn_close.onRelease = function()
{
   _visible = false;
   if(_level0.inPause)
   {
      _level0.game_pause();
   }
};
