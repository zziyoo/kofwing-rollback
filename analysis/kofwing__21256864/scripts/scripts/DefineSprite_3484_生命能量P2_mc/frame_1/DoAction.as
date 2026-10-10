if(_level0.glowMode)
{
   var myShadow = new flash.filters.DropShadowFilter(5,135,0,100,5,5,0.75,1,false,false,false);
   this.filters = [myShadow];
}
var a = {ra:25,rb:255,ga:75,gb:102,ba:0,bb:0,aa:100,ab:0};
var nameColor0 = new Color(_level0.LP_P1.name_mc0);
var nameColor = new Color(name_mc);
var c = nameColor0.getTransform();
if(_level0.mode_role_P2 == 2 && _level0.charSelect_P2 != "Zero" && _level0.charSelect_P2 != "Orochi")
{
   nameColor.setTransform(a);
}
else
{
   nameColor.setTransform(c);
}
var nameColor22 = new Color(name_mc22);
var nameColor23 = new Color(name_mc23);
var nameValue21 = _level0.charSelect_P2;
var nameValue22 = _level0.charSelect_P22;
var nameValue23 = _level0.charSelect_P23;
if(_level0.mode_role_P2 > 1 && (_level0.charSelect_P2 == "Zero" || _level0.charSelect_P2 == "Orochi"))
{
   nameValue21 += _level0.mode_role_P2;
}
if(_level0.mode_role_P22 > 1 && (_level0.charSelect_P22 == "Zero" || _level0.charSelect_P22 == "Orochi"))
{
   nameValue22 += _level0.mode_role_P22;
}
if(_level0.mode_role_P23 > 1 && (_level0.charSelect_P23 == "Zero" || _level0.charSelect_P23 == "Orochi"))
{
   nameValue23 += _level0.mode_role_P23;
}
if(_level0.charSelect_P2 == "Iori" && _level0.mode_role_P2 == 3)
{
   nameValue21 += _level0.mode_role_P2;
}
if(_level0.charSelect_P22 == "Iori" && _level0.mode_role_P22 == 3)
{
   nameValue22 += _level0.mode_role_P22;
}
if(_level0.charSelect_P23 == "Iori" && _level0.mode_role_P23 == 3)
{
   nameValue23 += _level0.mode_role_P23;
}
if(_level0.moreVs == true && _level0.moreVs3V3 != true && _level0.player_type == "1PVSCOM" && (_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8))
{
   name_mc22.gotoAndStop("none");
   name_mc23.gotoAndStop("none");
}
if(_level0.moreVs == true && _level0.moreVs3V3 == true && _level0.player_type == "1PVSCOM" && (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6))
{
   name_mc22.gotoAndStop("none");
   name_mc23.gotoAndStop("none");
}
if(_level0.moreVs != true)
{
   name_mc22.gotoAndStop("none");
   name_mc23.gotoAndStop("none");
}
if(_level0.moreVs == true && _level0.moreVs3V3 != true)
{
   name_mc22.gotoAndStop(nameValue22);
   name_mc23.gotoAndStop("none");
   if(_level0.mode_role_P22 == 2 && _level0.charSelect_P22 != "Zero" && _level0.charSelect_P22 != "Orochi")
   {
      nameColor22.setTransform(a);
   }
}
if(_level0.moreVs == true && _level0.moreVs3V3 == true)
{
   name_mc22.gotoAndStop(nameValue22);
   name_mc23.gotoAndStop(nameValue23);
   if(_level0.mode_role_P22 == 2 && _level0.charSelect_P22 != "Zero" && _level0.charSelect_P22 != "Orochi")
   {
      nameColor22.setTransform(a);
   }
   if(_level0.mode_role_P23 == 2 && _level0.charSelect_P23 != "Zero" && _level0.charSelect_P23 != "Orochi")
   {
      nameColor23.setTransform(a);
   }
}
