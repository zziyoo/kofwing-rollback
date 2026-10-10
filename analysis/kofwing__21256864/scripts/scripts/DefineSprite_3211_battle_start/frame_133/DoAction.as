if(_level0.moreVs == true)
{
   this.onEnterFrame = function()
   {
      if(_level0.IoriStarted == 2)
      {
         play();
         _level0.role_reset();
         _level0.char_mc._y = 0;
         _level0.stageControl_mc.stopControl();
         _level0.stageControl_mc.startControl();
         delete this.onEnterFrame;
      }
      else
      {
         stop();
      }
   };
}
else
{
   _level0.role_reset();
   _level0.char_mc._y = 0;
   _level0.stageControl_mc.stopControl();
   _level0.stageControl_mc.startControl();
}
