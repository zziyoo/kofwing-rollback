onClipEvent(keyDown){
   if(Key.isDown(_level0.p) || Key.isDown(_level0.p_l) || Key.isDown(_level0.k))
   {
      _level0.ok_snd.start();
      _parent.saveOption();
      _parent._parent.play();
      this.removeMovieClip();
   }
}
