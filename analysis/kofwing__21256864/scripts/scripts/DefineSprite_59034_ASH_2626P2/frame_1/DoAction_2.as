function hit()
{
   gotoAndStop("onHit");
   play();
}
allowNum = 1;
dirs = this.dir;
var counter = 0;
var timer = 350;
var vx = 12;
var hits = 0;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   counter++;
   if(this._currentframe >= 10 && this._currentframe < 26 && vx > 0)
   {
      _X = _X + vx * dirs;
      vx -= 0.2;
   }
   if(this._currentframe >= 10 && this._currentframe < 24)
   {
      if(hits >= 12)
      {
         gotoAndStop("explode");
         play();
      }
      else if(hits >= 11)
      {
         gotoAndStop("hitEnd");
         play();
      }
      else if(vx > 10)
      {
         gotoAndStop("hit1");
      }
      else if(vx > 8)
      {
         gotoAndStop("hit2");
      }
      else if(vx > 6)
      {
         gotoAndStop("hit3");
      }
      else if(vx > 4)
      {
         gotoAndStop("hit4");
      }
      else if(vx > 2)
      {
         gotoAndStop("hit5");
      }
      else
      {
         gotoAndStop("hit6");
      }
   }
   var _loc3_ = _X + _level0.char_mc._x;
   if(_loc3_ > 963 || _loc3_ < -110)
   {
      this.removeMovieClip();
   }
   if(_root.role_mc.player_type == "cpu" && _root.role_mc.status_2 == "land" && _root.role_mc.status_3 != "attack")
   {
      _root.role_mc.dfdf_P_2_check();
   }
   if(counter >= timer || _root.role_mc.opp.isKO || _level0.KO)
   {
      delete this.onEnterFrame;
      gotoAndStop("explode");
      play();
   }
};
