function getReverseDir(key)
{
   var _loc2_;
   if(_root.role_mc[key] == _root.role_mc.f)
   {
      _loc2_ = _root.role_mc.b;
      return _loc2_;
   }
   if(_root.role_mc[key] == _root.role_mc.b)
   {
      _loc2_ = _root.role_mc.f;
      return _loc2_;
   }
}
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var pressFunc;
var endFunc;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(Key.isDown(_root.role_mc[keyCode]))
   {
      if(keyCode_dir != "")
      {
         if(Key.isDown(_root.role_mc[keyCode_dir]) && _root.role_mc.dir == 1 || Key.isDown(getReverseDir(keyCode_dir)) && _root.role_mc.dir == -1)
         {
            pressFunc();
            delete this.onEnterFrame;
         }
      }
      else
      {
         pressFunc();
         delete this.onEnterFrame;
      }
   }
};
this.onUnload = function()
{
   endFunc();
};
pressFunc = function()
{
   _parent.gotoAndPlay("hit");
};
