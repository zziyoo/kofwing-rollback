on(release){
   setting_mc.gotoAndStop("display");
   if(settingShow != "display")
   {
      setting_mc._visible = true;
      settingShow = "display";
   }
   else
   {
      setting_mc._visible = false;
      settingShow = "";
   }
}
