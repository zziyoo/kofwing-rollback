_quality = quality2;
transOut();
role_init();
if(player_type == "trainning")
{
   trainning_start();
}
else
{
   timer_start();
}
if(!isLoadMusic)
{
   bgm_mc.play();
}
else
{
   bgmControl_mc.playSound();
}
if(!isLoadStage)
{
   stageControl_mc.init2();
   stageControl_mc.init(863,510,stage_mc);
   stageControl_mc.startControl();
}
else
{
   stageControl_mc.init2();
   stageControl_mc.init(863,510,stage_mc.mc);
   stageControl_mc.startControl();
}
onEnterFrame = function()
{
   P1_role.checkSide();
   P2_role.checkSide();
   P1_role.checkTouch(0);
   P2_role.checkTouch(0);
};
