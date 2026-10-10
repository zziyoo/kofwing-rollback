onClipEvent(keyDown){
   if(Key.isDown(_level0.u))
   {
      if(_parent._currentframe == 1)
      {
         _parent.gotoAndStop(_parent._totalframes);
      }
      else
      {
         _parent.prevFrame();
      }
      _level0.select_snd.start();
   }
   else if(Key.isDown(_level0.d))
   {
      if(_parent._currentframe == _parent._totalframes)
      {
         _parent.gotoAndStop(1);
      }
      else
      {
         _parent.nextFrame();
      }
      _level0.select_snd.start();
   }
}
