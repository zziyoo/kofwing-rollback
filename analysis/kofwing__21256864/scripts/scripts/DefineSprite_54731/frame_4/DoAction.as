if(!jumped)
{
   _level0.k_snd.start();
   _parent.start_move_Y1(_parent.Vy,_parent.Vx);
}
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.air_check();
   };
}
