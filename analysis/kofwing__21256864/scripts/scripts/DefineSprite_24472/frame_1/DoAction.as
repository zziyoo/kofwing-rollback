if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var pressFunc;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(Key.isDown(_root.role_mc[keyCode]))
   {
      pressFunc();
      delete this.onEnterFrame;
   }
};
pressFunc = function()
{
   _parent.gotoAndPlay("tx");
};
