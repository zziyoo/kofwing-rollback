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
