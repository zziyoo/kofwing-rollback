var owner = this;
slideBar._height /= _parent.ratio;
var moving = false;
slideBar.onPress = function()
{
   owner.moving = true;
   slideBar.startDrag(false,0,0,0,slideBar_bg._height - slideBar._height);
};
slideBar.onMouseMove = function()
{
   if(owner.moving)
   {
      owner._parent.setting_mc._y = _parent.originY - slideBar._y * _parent.ratio;
   }
};
slideBar.onRelease = function()
{
   owner.moving = false;
   slideBar.stopDrag();
};
