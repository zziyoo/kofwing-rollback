var jumped = false;
var ran = Math.random();
if(!Key.isDown(_parent.u))
{
   if(_parent.player_type != "cpu")
   {
      jumped = true;
      _level0.k_snd.start();
      _parent.start_move_Y1(_parent.Vy * 2 / 3,_parent.Vx);
   }
}
hitPos = "up";
