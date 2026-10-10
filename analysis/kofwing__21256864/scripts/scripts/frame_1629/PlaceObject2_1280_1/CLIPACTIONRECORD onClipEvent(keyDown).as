onClipEvent(keyDown){
   if(_level0.autoPlayGame)
   {
      _level0.autoPlayGame = false;
      _level0.autoSelectRank = false;
      _level0.autoPlayGameGotoMain();
   }
}
