stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
_level0.effBg(1,effect,_root.roleSide);
this.onUnload = function()
{
   _level0.effBg(0);
};
