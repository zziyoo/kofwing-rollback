function decTimer()
{
   nowTime--;
   txtTime.text = nowTime.toString();
}
function showButton()
{
   setting.data.licenseShowed = true;
   setting.flush();
   txtConfirm._visible = true;
   btnConfirm._visible = true;
   _hint._visible = false;
   txtTime._visible = false;
   clearInterval(timer);
   clearInterval(timer2);
}
stop();
_level0.showMoreMsg = _level0.setting.data.showMoreMsg;
_level0.SE_old = _level0.setting.data.SE_old;
_level0.moreVs = _level0.setting.data.moreVs;
_level0.moreVs3V3 = _level0.setting.data.moreVs3V3;
setting.flush();
txtConfirm._visible = false;
btnConfirm._visible = false;
var timer;
var timer2;
var nowTime = 10;
if(onLine)
{
   showButton();
   return undefined;
}
if(setting.data.licenseShowed == true)
{
   _hint._visible = false;
   txtTime._visible = false;
   showButton();
}
else
{
   timer = setInterval(showButton,10000);
   timer2 = setInterval(decTimer,1000);
}
