onClipEvent(keyDown){
   if(Key.isDown(_level0.b) || Key.isDown(_level0.b2))
   {
      _parent.gotoMenu3("left");
   }
   else if(Key.isDown(_level0.f) || Key.isDown(_level0.f2))
   {
      _parent.gotoMenu3("right");
   }
   else if(Key.isDown(_level0.p) || Key.isDown(_level0.p2) || Key.isDown(13))
   {
      _parent.select3();
   }
}
