on(release){
   if(!hint_instruction._visible)
   {
      hint_instruction._visible = true;
   }
   else
   {
      hint_instruction._visible = false;
   }
   if(!_level0.inPause)
   {
      _level0.game_pause();
   }
}
