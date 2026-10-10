stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
this._name = "cancle_mc";
if(_root.mode_cancle)
{
   cancle = true;
}
else
{
   cancle = cancle;
}
key = "";
onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(Key.isDown(_root.p) && key == "")
   {
      key = "P";
   }
   else if(Key.isDown(_root.k) && key == "")
   {
      key = "K";
   }
   if(_parent._currentframe > startFrame && key != "")
   {
      _root.chain.check_combo(key);
      delete this.onEnterFrame;
   }
};
