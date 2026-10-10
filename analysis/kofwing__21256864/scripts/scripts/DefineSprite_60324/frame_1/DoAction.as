var settingShow = "";
setting_mc._visible = false;
var btnArray = ["refresh","life","disp","fight","oppset"];
var i = 0;
while(i < btnArray.length)
{
   this["trigger_" + btnArray[i]]._visible = false;
   i++;
}
if(_level0.player_type != "trainning")
{
   trigger_setting._visible = false;
}
var skList = createEmptyMovieClip("skillList",0);
loadMovie("data/skillList.swf",skList);
onEnterFrame = function()
{
   if(skList.getBytesLoaded() >= skList.getBytesTotal() && skList.getBytesTotal() > 0)
   {
      skList._visible = false;
      delete this.onEnterFrame;
      skList.currentName = _level0.charSelect_P1;
      skList.currentMode = _level0.mode_role_P1;
      skList.onLoadSkill();
   }
};
