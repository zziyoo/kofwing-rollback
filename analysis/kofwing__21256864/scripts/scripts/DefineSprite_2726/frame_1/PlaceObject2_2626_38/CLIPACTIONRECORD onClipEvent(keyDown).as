onClipEvent(keyDown){
   if(Key.isDown(_level0.p))
   {
      _level0.ok_snd.start();
      _level0.lifeBar_num = _parent.life;
      _parent._parent.play();
      this.removeMovieClip();
   }
}
