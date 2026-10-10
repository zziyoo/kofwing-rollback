stop();
_visible = false;
role = _root.role_mc;
this.onEnterFrame = function()
{
   if(_level0.inPause)
   {
      return undefined;
   }
   if(role.inBurst == true && role.burst_mode == "attack")
   {
      play();
      delete this.onEnterFrame;
   }
};
