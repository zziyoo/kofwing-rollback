onClipEvent(keyDown){
   if(Key.isDown(_level0.key_P1[0].b))
   {
      _parent.stage_select.prevStage();
      _level0.select_snd.start();
   }
   else if(Key.isDown(_level0.key_P1[0].f))
   {
      _parent.stage_select.nextStage();
      _level0.select_snd.start();
   }
}
