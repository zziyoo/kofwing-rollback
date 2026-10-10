onClipEvent(keyDown){
   if(Key.isDown(_level0.b))
   {
      _parent.stage_select.prevStage();
      _level0.select_snd.start();
   }
   else if(Key.isDown(_level0.f) || Key.isDown(68))
   {
      _parent.stage_select.nextStage();
      _level0.select_snd.start();
   }
}
