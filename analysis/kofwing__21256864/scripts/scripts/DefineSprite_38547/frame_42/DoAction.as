var _left = true;
var i = 10;
var shakeV = 15;
if(_root.role_mc.opp.status_1 == "hurt2")
{
   _level0._x += shakeV / 2;
   _level0.zoomControl_mc.zoomIn(_level0.char_mc,_parent.opp,1.35,0.8);
   this.onEnterFrame = function()
   {
      _root.role_mc.opp.mc.stop();
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
else
{
   gotoAndStop("nohit");
   play();
}
