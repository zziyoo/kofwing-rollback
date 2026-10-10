function fonex()
{
   setting.data.BGM = true;
   setting.data.defend = true;
   setting.data.moreVs = true;
   setting.data.moreVs3V3 = true;
   setting.data.counterMode = true;
   setting.data.glow2P = false;
   setting.data.glow2Ptype = false;
   setting.data.BgmVolume = 100;
   setting.data.volume = 20;
   setting.data.startGameTime = getTimer();
   setting.data.showMoreMsg = true;
   setting.data.SE_old = false;
   setting.flush();
}
function saveSoMsg(bool)
{
   fonex();
   setting.data.soMsg = bool;
   setting.flush();
}
function getSoMsg()
{
   return setting.data.soMsg;
}
stop();
if(setting.data.soMsg == undefined)
{
   saveSoMsg(true);
}
else
{
   play();
}
