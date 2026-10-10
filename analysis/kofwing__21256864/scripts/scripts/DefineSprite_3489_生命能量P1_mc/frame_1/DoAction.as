if(_level0.glowMode)
{
   var myShadow = new flash.filters.DropShadowFilter(5,45,0,100,5,5,0.75,1,false,false,false);
   this.filters = [myShadow];
}
name_mc0.gotoAndStop("none");
var a = {ra:25,rb:255,ga:75,gb:102,ba:0,bb:0,aa:100,ab:0};
var nameColor0 = new Color(name_mc0);
var nameColor = new Color(name_mc);
var c = nameColor0.getTransform();
if(_level0.mode_role_P1 == 2 && _level0.charSelect_P1 != "Zero" && _level0.charSelect_P1 != "Orochi")
{
   nameColor.setTransform(a);
}
else
{
   nameColor.setTransform(c);
}
var nameColor2 = new Color(name_mc12);
var nameColor3 = new Color(name_mc13);
var nameValue1 = _level0.charSelect_P1;
var nameValue2 = _level0.charSelect_P12;
var nameValue3 = _level0.charSelect_P13;
if(_level0.mode_role_P1 > 1 && (_level0.charSelect_P1 == "Zero" || _level0.charSelect_P1 == "Orochi"))
{
   nameValue1 += _level0.mode_role_P1;
}
if(_level0.mode_role_P12 > 1 && (_level0.charSelect_P12 == "Zero" || _level0.charSelect_P12 == "Orochi"))
{
   nameValue2 += _level0.mode_role_P12;
}
if(_level0.mode_role_P13 > 1 && (_level0.charSelect_P13 == "Zero" || _level0.charSelect_P13 == "Orochi"))
{
   nameValue3 += _level0.mode_role_P13;
}
if(_level0.charSelect_P1 == "Iori" && _level0.mode_role_P1 == 3)
{
   nameValue1 += _level0.mode_role_P1;
}
if(_level0.charSelect_P12 == "Iori" && _level0.mode_role_P12 == 3)
{
   nameValue2 += _level0.mode_role_P12;
}
if(_level0.charSelect_P13 == "Iori" && _level0.mode_role_P13 == 3)
{
   nameValue3 += _level0.mode_role_P13;
}
if(_level0.moreVs != true)
{
   name_mc12.gotoAndStop("none");
   name_mc13.gotoAndStop("none");
}
if(_level0.moreVs == true && _level0.moreVs3V3 != true)
{
   name_mc12.gotoAndStop(nameValue2);
   name_mc13.gotoAndStop("none");
   if(_level0.mode_role_P12 == 2 && _level0.charSelect_P12 != "Zero" && _level0.charSelect_P12 != "Orochi")
   {
      nameColor2.setTransform(a);
   }
}
if(_level0.moreVs == true && _level0.moreVs3V3 == true)
{
   name_mc12.gotoAndStop(nameValue2);
   name_mc13.gotoAndStop(nameValue3);
   if(_level0.mode_role_P12 == 2 && _level0.charSelect_P12 != "Zero" && _level0.charSelect_P12 != "Orochi")
   {
      nameColor2.setTransform(a);
   }
   if(_level0.mode_role_P13 == 2 && _level0.charSelect_P13 != "Zero" && _level0.charSelect_P13 != "Orochi")
   {
      nameColor3.setTransform(a);
   }
}
