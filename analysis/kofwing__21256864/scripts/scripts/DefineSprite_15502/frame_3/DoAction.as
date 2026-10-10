_level0.p_snd.start();
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.f_kl_check();
   };
}
