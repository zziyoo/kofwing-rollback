hitPos = "down";
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.punch_check();
   };
}
