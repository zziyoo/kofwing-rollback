function getDis()
{
   return Math.abs(_root.role_mc._x - _root.role_mc.opp._x);
}
function getOppHeight()
{
   return Math.abs(_root.role_mc.opp._y - _root.role_mc.land_Y);
}
function paizhen_check()
{
   var _loc2_ = Math.random();
   if(getDis() < 200 && _root.role_mc.opp.status_4 != "hold" && _root.role_mc.opp.status_2 != "down" && _root.role_mc.opp.status_2 != "" && _root.role_mc.opp.status_3 == "attack")
   {
      gotoAndStop("att");
      play();
   }
   else if(getDis() < 350 && _root.role_mc.opp.status_3 == "attack")
   {
      gotoAndStop("att");
      play();
   }
   else if(getOppHeight() > 200 && _root.role_mc.opp.status_3 == "hurt")
   {
      gotoAndStop("att");
      play();
   }
   else if(_root.role_mc.opp.status_3 == "hurt" && _loc2_ <= 0.025 && _root.role_mc.opp.status_2 == "land")
   {
      gotoAndStop("att");
      play();
   }
}
delete this.onEnterFrame;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      stop();
   }
   else
   {
      play();
   }
   _X = role._x - 40;
   _Y = role._y - 150;
   if(_root.role_mc.status_3 == "hurt")
   {
      _root.role_mc.hasPai = false;
      this.removeMovieClip();
   }
   if(_root.role_mc.player_type == "cpu" && this._currentframe < 300)
   {
      paizhen_check();
   }
};
var owner = this;
key_s.holdFunc = function()
{
};
if(_root.role_mc.player_type != "cpu")
{
   key_s.releaseFunc = function()
   {
      owner.gotoAndPlay("att");
   };
   key_s.endFunc = function()
   {
      owner.gotoAndPlay("att");
   };
}
