onClipEvent(keyDown){
   if(Key.isDown(_level0.u) || Key.isDown(_level0.u2))
   {
      _parent.gotoMenu("up");
   }
   else if(Key.isDown(_level0.d) || Key.isDown(_level0.d2))
   {
      _parent.gotoMenu("down");
   }
   else if(Key.isDown(_level0.p) || Key.isDown(_level0.p2) || Key.isDown(13))
   {
      _parent.select();
   }
}
