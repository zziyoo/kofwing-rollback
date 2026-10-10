function goto(jumpType)
{
   hint_mc._type = jumpType;
   if(jumpType == "XIII" || jumpType == "ashShadow")
   {
      hint_mc.gotoAndStop("glow");
   }
   else
   {
      hint_mc.gotoAndStop(jumpType);
   }
}
var originY = setting_mc._y;
var mouseListener = new Object();
mouseListener.onMouseWheel = function(delta)
{
   setting_mc._y += delta * 5;
   if(setting_mc._y < originY - (slide_bar.slideBar_bg._height - slide_bar.slideBar._height))
   {
      setting_mc._y = originY - (slide_bar.slideBar_bg._height - slide_bar.slideBar._height);
   }
   else if(setting_mc._y > originY)
   {
      setting_mc._y = originY;
   }
   slide_bar.slideBar._y = originY - setting_mc._y;
};
Mouse.addListener(mouseListener);
