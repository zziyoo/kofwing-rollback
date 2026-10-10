function adjGlow(bool)
{
   _parent.goto("glow");
   _level0.saveGlow(bool);
   if(bool)
   {
      btnGlowType._enable = true;
      btnGlowType.btn.gotoAndStop(1);
      btnAshShadow._enable = true;
      btnAshShadow.btn.gotoAndStop(1);
      _parent.hint_mc._visible = true;
   }
   else
   {
      btnGlowType._enable = false;
      btnGlowType.btn.gotoAndStop(2);
      btnAshShadow._enable = false;
      btnAshShadow.btn.gotoAndStop(2);
      _parent.hint_mc._visible = false;
   }
}
function adjXIIIEff(bool)
{
   if(!_level0.XIIIeffOpen)
   {
      _parent.goto("XIIIclose");
   }
   else
   {
      _parent.goto("XIII");
   }
   _level0.saveXIIIeff(bool);
   if(bool)
   {
      _parent.hint_mc._visible = true;
   }
   else
   {
      _parent.hint_mc._visible = false;
   }
}
function adjEffType(bool)
{
   _level0.saveEffType(bool);
}
function adjFlashing(bool)
{
   _level0.saveFlashing(bool);
}
function adjGlow2P(bool)
{
   _parent.goto("glow2P");
   _level0.saveGlow2P(bool);
   if(bool)
   {
      btnGlow2Ptype._enable = true;
      btnGlow2Ptype.btn.gotoAndStop(1);
      _parent.hint_mc._visible = true;
   }
   else
   {
      btnGlow2Ptype._enable = false;
      btnGlow2Ptype.btn.gotoAndStop(2);
      _parent.hint_mc._visible = false;
   }
}
function adjGlow2Ptype(bool)
{
   _level0.saveGlow2Ptype(bool);
}
function adjLang(bool)
{
   _level0.saveLang(bool);
}
function adjAshShadow(bool)
{
   _level0.saveAshShadow(bool);
   _parent.goto("ashShadow");
   if(bool)
   {
      _parent.hint_mc._visible = true;
   }
   else
   {
      _parent.hint_mc._visible = false;
   }
}
function getGlow()
{
   if(_level0.getGlowData())
   {
      btnGlowType._enable = true;
      btnAshShadow._enable = true;
   }
   else
   {
      btnGlowType._enable = false;
      btnAshShadow._enable = false;
   }
   return _level0.getGlowData();
}
function getXIIIEff()
{
   return _level0.getXIIIEffData();
}
function getEffType()
{
   return _level0.getEffTypeData();
}
function getFlashing()
{
   return _level0.getFlashing();
}
function getGlow2P()
{
   return _level0.getGlow2P();
}
function getGlow2Ptype()
{
   return _level0.getGlow2Ptype();
}
function getLang()
{
   return _level0.getLang();
}
function getAshShadow()
{
   return _level0.getAshShadow();
}
stop();
if(_level0.lan == "en")
{
   gotoAndStop(2);
}
