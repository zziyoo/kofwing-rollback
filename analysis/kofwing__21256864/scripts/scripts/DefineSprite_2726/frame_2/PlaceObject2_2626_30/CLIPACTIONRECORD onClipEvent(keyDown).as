onClipEvent(keyDown){
   if(Key.isDown(_level0.b))
   {
      _parent.enemy_mc.prevFrame();
      _level0.select_snd.start();
   }
   else if(Key.isDown(_level0.f) || Key.isDown(68))
   {
      _parent.enemy_mc.nextFrame();
      _level0.select_snd.start();
   }
}
