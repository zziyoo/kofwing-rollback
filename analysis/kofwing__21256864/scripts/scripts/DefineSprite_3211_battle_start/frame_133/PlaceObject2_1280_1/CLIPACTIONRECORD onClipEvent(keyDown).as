onClipEvent(keyDown){
   if(isClosed != true)
   {
      isClosed = true;
      _level0.transIn();
   }
   if(_level0.moreVs == true)
   {
      _level0.IoriStarted = 2;
   }
}
