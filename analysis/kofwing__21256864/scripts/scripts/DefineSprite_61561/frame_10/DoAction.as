stop();
if(_level0.SE_old)
{
   _level0.mainTitle_snd.stop();
}
else
{
   _level0.mainTitle02um_snd.stop();
}
_level0.option_snd.start(0,1000);
delete this.onEnterFrame;
_level0.gotoAndStop("menu");
