stop();
this.swapDepths(125847);
mc._visible = false;
_global.out = function(msg)
{
   if(mc._visible)
   {
      mc.text += "\n" + msg;
   }
};
_root.out = _global.out;
