onClipEvent(keyDown){
   if(Key.isDown(_root.key_esc) || Key.isDown(27))
   {
      _parent.play();
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
