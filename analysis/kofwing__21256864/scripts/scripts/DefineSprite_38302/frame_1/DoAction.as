stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
_level0.shake_mc.shakeStart(shake_times,shake_v);
_level0.out(_level0.shake_mc.shakeStart);
