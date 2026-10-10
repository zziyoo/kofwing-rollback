if(_level0.setting.data.helpShowed[hintType] == 2)
{
   mc.gotoAndStop(1);
}
btn.onRelease = function()
{
   func.call();
   _level0.setting.data.helpShowed[hintType] = 2;
   mc.gotoAndStop(1);
};
