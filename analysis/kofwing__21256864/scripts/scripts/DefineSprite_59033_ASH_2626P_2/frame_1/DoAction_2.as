function hit()
{
   play();
}
allowNum = 1;
dirs = this.dir;
var counter = 0;
var timer = 350;
var vx = 13;
this.onEnterFrame = function()
{
   if(_level0.inPause || _level0.inFreeze)
   {
      return undefined;
   }
   counter++;
   if(this._currentframe >= 10 && vx > 0)
   {
      _X = _X + vx * dirs;
      vx--;
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
