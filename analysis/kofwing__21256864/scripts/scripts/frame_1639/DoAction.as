function addElement()
{
   shake_mc = element_mc.attachMovie("Stage_shake","Stage_shake",depth_shake);
   hitCounter1 = element_mc.attachMovie("counter","hitCounter1",depth_hitCounter,{role:P1_role});
   hitCounter2 = element_mc.attachMovie("counter","hitCounter2",depth_hitCounter + 1,{role:P2_role});
   life_power_mc = element_mc.attachMovie("life_power","life_power",depth_life,{_x:431,_y:0});
   menu_bottom_mc = element_mc.attachMovie("menu_bottom","menu_bottom",depth_menu);
   menu_bottom_trigger = element_mc.attachMovie("menu_bottom_trigger","menu_bottom_trigger",depth_menu + 1);
}
function asd()
{
   bgEff_mc = this.createEmptyMovieClip("bgEff_mc",depth_bgEff1);
   bgEff_mc = this.createEmptyMovieClip("bgEff_mc",depth_bgEff1);
}
function addd()
{
   bgEff_mc = this.createEmptyMovieClip("bgEff_mc",depth_bgEff1);
   fgEff2_mc = this.createEmptyMovieClip("fgEff2_mc",depth_fgEff2);
   fgEff_mc = this.createEmptyMovieClip("fgEff_mc",depth_fgEff);
   effect_mc = char_mc.attachMovie("effect","effect_mc",depth_effect);
   effect_mc_bg = char_mc.createEmptyMovieClip("effect_mc_bg",depth_effect_bg);
   effect_mc_fg = char_mc.createEmptyMovieClip("effect_mc_fg",depth_effect_fg);
}
createEmptyMovieClip("element_mc",depth_other);
bgEff_mc = this.createEmptyMovieClip("bgEff_mc",depth_bgEff1);
fgEff2_mc = this.createEmptyMovieClip("fgEff2_mc",depth_fgEff2);
fgEff_mc = this.createEmptyMovieClip("fgEff_mc",depth_fgEff);
effect_mc = char_mc.attachMovie("effect","effect_mc",depth_effect);
effect_mc_bg = char_mc.createEmptyMovieClip("effect_mc_bg",depth_effect_bg);
effect_mc_fg = char_mc.createEmptyMovieClip("effect_mc_fg",depth_effect_fg);
addElement();
