if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      delete this.onEnterFrame;
   };
}
