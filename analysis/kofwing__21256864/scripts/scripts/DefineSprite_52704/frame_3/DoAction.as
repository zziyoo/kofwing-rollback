var jumped = false;
var ran = Math.random();
if(!Key.isDown(_parent.u))
{
   if(_parent.player_type != "cpu")
   {
      jumped = true;
      _parent.start_move_Y1(_parent.Vy * 2 / 3,_parent.Vx);
   }
}
hitPos = "up";
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.air_check();
   };
}
