XIII.stop();
if(_level0.XIIIeff)
{
   XIII.play();
}
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      XIII.stop();
   }
};
