onClipEvent(load){
   hintType = "game";
   func = function()
   {
      if(!_level0.inPause)
      {
         _level0.game_pause();
         _parent.ad_mc.showAd();
      }
      _parent.hint_mc.showHint("game");
   };
}
