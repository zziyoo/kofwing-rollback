onClipEvent(keyDown){
   if(Key.isDown(_root.key_esc))
   {
      _level0.exitTo("charSelect");
   }
   else if(!Key.isDown(112))
   {
      if(!Key.isDown(113))
      {
         if(Key.isDown(_root.key_sound))
         {
            _level0.setSound();
         }
         else if(Key.isDown(_root.key_fullScreen))
         {
            _level0.fullScreen();
         }
      }
   }
}
