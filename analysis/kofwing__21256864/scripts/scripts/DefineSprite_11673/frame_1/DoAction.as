if(_parent.player_type == "cpu" && _parent.roleMode == 2)
{
   this.onEnterFrame = function()
   {
      _parent.punch_s2_check();
   };
}
