function setCharacter(mc, name, role, type, _canSelect, hasHidden)
{
   mc.$name = name;
   mc.$role = role;
   mc.$type = type;
   mc.canSelect = _canSelect;
   mc.$hasHidden = hasHidden;
   mc.gotoAndStop(role);
}
stop();
var cantSelect = ["c","i","j","l","m","o"];
var canPress = false;
player._visible = true;
if(_level0.passIori3)
{
   gotoAndStop("Iori3");
}
else if(_level0.passOrochi)
{
   gotoAndStop("Orochi");
}
else if(_level0.passCero)
{
   gotoAndStop("Czero");
}
if(_level0.onLine)
{
   var _i = 0;
   while(_i < cantSelect.length)
   {
      this[cantSelect[_i]].canSelect = false;
      this[cantSelect[_i]].localHint = true;
      this[cantSelect[_i]]._alpha = 50;
      _i++;
   }
}
