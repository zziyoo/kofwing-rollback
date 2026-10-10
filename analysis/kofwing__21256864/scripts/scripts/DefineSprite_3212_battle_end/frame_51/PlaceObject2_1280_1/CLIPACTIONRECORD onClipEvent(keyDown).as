onClipEvent(keyDown){
   setTimeout(function()
   {
      delete _parent.onEnterFrame;
      _parent.gotoAndPlay("f2");
   }
   ,3000);
}
