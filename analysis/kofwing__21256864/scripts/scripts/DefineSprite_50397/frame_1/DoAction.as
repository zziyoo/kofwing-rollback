hitPos = "up";
if(_parent._y == 445)
{
   jumped = true;
   _parent.start_move_Y1(_parent.Vy * 2 / 3,_parent.Vx);
}
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.air_check_jump_2d();
   };
}
