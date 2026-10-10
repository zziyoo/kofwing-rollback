var jumped = false;
var ran = Math.random();
if(!Key.isDown(_parent.u))
{
   if(!(_parent.player_type == "cpu" && ran > 0.2))
   {
      jumped = true;
      _level0.k_snd.start();
      _parent.start_move_Y1(_parent.Vy * 3 / 4,_parent.Vx);
   }
}
hitPos = "up";
