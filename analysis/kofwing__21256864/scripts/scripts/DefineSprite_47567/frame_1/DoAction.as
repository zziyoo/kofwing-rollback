stop();
var holdFunc;
var releaseFunc;
var endFunc;
var keyCode;
for(var i in keyArray)
{
   var key = keyArray[i];
   if(Key.isDown(_root.role_mc[key]))
   {
      keyCode = _root.role_mc[key];
   }
}
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(Key.isDown(keyCode))
   {
      holdFunc();
   }
   else
   {
      this.onUnload = function()
      {
      };
      releaseFunc();
      delete this.onEnterFrame;
   }
};
this.onUnload = function()
{
   endFunc();
};
