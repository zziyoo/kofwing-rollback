_parent.checkSide_abs();
if(_parent.player_type == "cpu")
{
   this.onEnterFrame = function()
   {
      _parent.sk_df_k_air_check();
   };
}
