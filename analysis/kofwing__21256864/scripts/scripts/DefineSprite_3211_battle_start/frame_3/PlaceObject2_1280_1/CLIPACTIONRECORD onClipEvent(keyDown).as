onClipEvent(keyDown){
   delete this.onEnterFrame;
   _level0.transIn();
   if(_level0.player_type == "trainning")
   {
      _parent.gotoAndPlay("trainning");
   }
   else
   {
      _parent.gotoAndPlay("trans");
   }
}
