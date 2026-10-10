onClipEvent(keyDown){
   if(Key.isDown(_level0.key_P1[0].b))
   {
      _parent.playTime_mc.prevFrame();
      _level0.select_snd.start();
   }
   else if(Key.isDown(_level0.key_P1[0].f))
   {
      _parent.playTime_mc.nextFrame();
      _level0.select_snd.start();
   }
}
