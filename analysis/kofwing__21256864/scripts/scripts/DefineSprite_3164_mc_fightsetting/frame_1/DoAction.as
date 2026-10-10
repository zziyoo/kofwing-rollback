function adjCounter(bool)
{
   _level0.saveCounter(bool);
}
function getCounter()
{
   return _level0.getCounter();
}
function adjBGM(bool)
{
   _level0.saveBGM(bool);
}
function getBGM()
{
   return _level0.getBGM();
}
function adjloading(bool)
{
   _level0.saveloading(bool);
}
function getloading()
{
   return _level0.getloading();
}
function adjdefend(bool)
{
   _level0.savedefend(bool);
}
function getdefend()
{
   return _level0.getdefend();
}
function adjmoreVs(bool)
{
   _level0.savemoreVs(bool);
}
function getmoreVs()
{
   return _level0.getmoreVs();
}
function adjmoreVs3V3(bool)
{
   _level0.savemoreVs3V3(bool);
}
function getmoreVs3V3()
{
   return _level0.getmoreVs3V3();
}
function adjShowMoreMsg(bool)
{
   _level0.saveShowMoreMsg(bool);
}
function getShowMoreMsg()
{
   return _level0.getShowMoreMsg();
}
function adjSE_OLD(bool)
{
   _level0.saveSE_OLD(bool);
}
function getSE_OLD()
{
   return _level0.getSE_OLD();
}
mc.gotoAndStop("s" + _level0.BgmVolume);
mc_effect.gotoAndStop("s" + _level0.volume);
stop();
if(_level0.lan == "en")
{
   gotoAndStop(2);
}
