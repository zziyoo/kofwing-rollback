var originY = setting_mc._y;
var mouseListener = new Object();
var ratio = setting_mc._height / slide_bar._height;
mouseListener.onMouseWheel = function(delta)
{
   setting_mc._y += delta * ratio;
   if(setting_mc._y < originY - (slide_bar.slideBar_bg._height - slide_bar.slideBar._height) * ratio)
   {
      setting_mc._y = originY - (slide_bar.slideBar_bg._height - slide_bar.slideBar._height) * ratio;
   }
   else if(setting_mc._y > originY)
   {
      setting_mc._y = originY;
   }
   slide_bar.slideBar._y = originY - setting_mc._y / ratio;
};
Mouse.addListener(mouseListener);
