this._visible = false;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(_root.role_mc.status_1 != "hong2" && _root.role_mc.status_1 != "hong2_l" && _root.role_mc.status_1 != "hong3" && _root.role_mc.status_1 != "hong3_l" && _root.role_mc.status_1 != "hong_max")
   {
      delete this.onEnterFrame;
      _level0.stageControl_mc.startControl();
      _level0.char_mc._y = 0;
      _level0.stageControl_mc.resetPosY();
      this.removeMovieClip();
   }
};
