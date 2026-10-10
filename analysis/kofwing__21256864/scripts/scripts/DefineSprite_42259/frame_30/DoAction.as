Vx = 30;
Va = 2.5;
f = 0;
_parent.newKeyControl.dir = - _parent.dir;
var _opp = _parent.opp;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_level0.inFreeze)
   {
      return undefined;
   }
   _opp._y = 445;
   var _loc3_ = (- Vx) * _parent.dir;
   if(_opp.egdecheck(_loc3_))
   {
      _parent.do_move((- _loc3_) / 3);
   }
   else
   {
      _opp._x += _loc3_;
   }
   Vx -= Va;
   if(Vx <= 0)
   {
      delete this.onEnterFrame;
   }
};
this.onUnload = function()
{
};
