onClipEvent(keyDown){
   if(Key.isDown(27))
   {
      if(_root.inFullScreen)
      {
         _level0.fullScreen();
      }
      else
      {
         _level0.exitTo("charSelect");
      }
   }
   else if(Key.isDown(112))
   {
      _level0.game_pause();
   }
   else if(Key.isDown(113))
   {
      _level0.setSound();
   }
   else if(Key.isDown(114))
   {
      _level0.fullScreen();
   }
   else if(Key.isDown(115))
   {
      _level0.exitTo("charSelect");
   }
   else if(Key.isDown(116))
   {
      if(!_level0.KO)
      {
         _level0.reset_trigger();
      }
   }
}
