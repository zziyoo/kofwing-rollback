function init(_keyObj)
{
   keyObj = _keyObj;
   this.onKeyDown = mode_select;
}
function mode_select()
{
   if(Key.isDown(keyObj.f))
   {
      if(modeMC.mc._currentframe == modeMC.mc._totalframes)
      {
         modeMC.mc.gotoAndStop(1);
      }
      else
      {
         modeMC.mc.nextFrame();
      }
      modeMC.gotoAndPlay(2);
      _level0.select_snd.start();
   }
   else if(Key.isDown(keyObj.b))
   {
      if(modeMC.mc._currentframe == 1)
      {
         modeMC.mc.gotoAndStop(modeMC.mc._totalframes);
      }
      else
      {
         modeMC.mc.prevFrame();
      }
      modeMC.gotoAndPlay(2);
      _level0.select_snd.start();
   }
   if(Key.isDown(keyObj.p) || Key.isDown(keyObj.k) || Key.isDown(keyObj.p_l) || Key.isDown(keyObj.k_l))
   {
      selectOK_mode();
   }
}
function selectOK_mode()
{
   _level0.ok_snd.start();
   selectMode = modeMC.mc.mode;
   Key.removeListener(this);
   callBack_selectEnd();
}
var selectMode;
Key.addListener(this);
