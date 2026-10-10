_level0.zoomControl_mc.zoomBack(0.5);
_root.role_mc._y -= 100;
_root.role_mc.opp._y -= 100;
if(_root.role_mc.dir == 1)
{
   _root.role_mc._x -= 300;
   _root.role_mc.opp._x -= 300;
}
else
{
   _root.role_mc._x += 300;
   _root.role_mc.opp._x += 300;
}
var _left = true;
var i = 10;
var shakeV = 15;
_level0._x += shaveV / 2;
_level0.zoomControl_mc.zoomIn(_level0.char_mc,_parent.opp,1.2,0.8);
_level0.charToCenter();
this.onEnterFrame = function()
{
   if(i == 0)
   {
      _level0._x = 0;
      delete this.onEnterFrame;
   }
   else
   {
      if(_left)
      {
         _level0._x -= shakeV;
         _left = false;
      }
      else
      {
         _level0._x += shakeV;
         _left = true;
      }
      i--;
   }
};
