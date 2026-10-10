if(_root.role_mc.roleMode == 2)
{
   this.blendMode = "subtract";
}
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      stop();
   }
   else
   {
      play();
   }
};
