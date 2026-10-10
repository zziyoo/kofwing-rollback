on(release){
   var arr = ["refresh","life","disp","fight","oppset","debug"];
   if(!trigger_refresh._visible)
   {
      var i = 0;
      while(i < arr.length)
      {
         this["trigger_" + arr[i]]._visible = true;
         i++;
      }
   }
   else
   {
      var i = 0;
      while(i < arr.length)
      {
         this["trigger_" + arr[i]]._visible = false;
         i++;
      }
   }
   if(_level0.player_type != "trainning" && _level0.lifeBar_num > 1)
   {
      trigger_life._visible = false;
   }
   if(_level0.player_type != "trainning")
   {
      trigger_oppset._visible = false;
   }
   if(!_level0.inPause)
   {
      _level0.game_pause();
   }
}
