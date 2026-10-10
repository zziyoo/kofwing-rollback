btn_close.onRelease = function()
{
   _visible = false;
   if(_level0.inPause)
   {
      _level0.game_pause();
      _parent.ad_mc.showAd();
   }
};
