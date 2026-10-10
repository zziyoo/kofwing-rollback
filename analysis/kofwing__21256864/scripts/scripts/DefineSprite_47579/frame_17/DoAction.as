_parent.opp._y = 445;
Vx = 20;
Va = 1;
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
   var _loc3_ = (- Vx) * _parent.dir;
   if(_opp.egdecheck(_loc3_))
   {
      _parent.do_move(- _loc3_);
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
