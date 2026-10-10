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
btn.onRollOver = function()
{
   hint._visible = true;
};
btn.onRollOut = function()
{
   hint._visible = false;
};
btn.onReleaseOutside = function()
{
   hint._visible = false;
};
