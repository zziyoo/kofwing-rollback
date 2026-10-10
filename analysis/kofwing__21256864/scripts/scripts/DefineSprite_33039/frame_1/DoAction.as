tx.stop();
if(_level0.XIIIeff)
{
   tx.play();
}
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      tx.stop();
   }
};
