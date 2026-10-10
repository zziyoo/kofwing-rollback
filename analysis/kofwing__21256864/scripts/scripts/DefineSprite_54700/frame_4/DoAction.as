if(!jumped)
{
   _parent.start_move_Y1(_parent.Vy,_parent.Vx);
   _level0.k_snd.start();
}
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.air_check();
   };
}
