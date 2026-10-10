var _left = true;
var i = 10;
var shakeV = 15;
if(_root.role_mc.opp.status_1 == "hurt1")
{
   _level0._x += shaveV / 2;
   _level0.zoomControl_mc.zoomIn(_level0.char_mc,_parent.opp,1.35,0.8);
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
}
