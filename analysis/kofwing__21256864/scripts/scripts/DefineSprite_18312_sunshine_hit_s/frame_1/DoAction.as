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
   if(_root.role_mc.status_3 == "hurt")
   {
      delete this.onEnterFrame;
      _level0.stageControl_mc.startControl();
      _level0.char_mc._y = 0;
      _level0.stageControl_mc.resetPosY();
      this.removeMovieClip();
   }
   if(_root.role_mc.status_1 != "sk_s_yangguang_s")
   {
      delete this.onEnterFrame;
      _level0.stageControl_mc.startControl();
      _level0.char_mc._y = 0;
      _level0.stageControl_mc.resetPosY();
      gotoAndPlay(57);
   }
   if(this.dir == 1)
   {
      this._x = 250 - _level0.char_mc._x;
   }
   else
   {
      this._x = 613 - _level0.char_mc._x;
   }
   if(_root.role_mc.opp._y > 150)
   {
      this._y = _root.role_mc.opp._y - 250;
   }
   else
   {
      this._y = -100;
   }
   if(_root.role_mc.opp.status_1 == "hurt3")
   {
      _root.role_mc.opp.mc.stop();
   }
};
