play();
this._visible = false;
stopAllSounds();
_level0.selectOrderListP2[0] = {name:_root.charSelect_P2,type:_root.mode_role_P2};
_level0.selectOrderListP2[1] = {name:_root.charSelect_P22,type:_root.mode_role_P22};
_level0.selectOrderListP2[2] = {name:_root.charSelect_P23,type:_root.mode_role_P23};
if(_level0.player_type == "1PVSCOM" && _level0.serviceName == "")
{
   _level0.selectOrderListP1[0] = {name:_root.charSelect_P1_origin,type:_root.mode_role_P1_origin};
   _level0.selectOrderListP1[1] = {name:_root.charSelect_P12_origin,type:_root.mode_role_P12_origin};
   _level0.selectOrderListP1[2] = {name:_root.charSelect_P13_origin,type:_root.mode_role_P13_origin};
}
if(_level0.player_type == "1PVSCOM" && (_level0.serviceName == "" || _level0.serviceName == undefined))
{
   _root.charSelect_P1 = _root.charSelect_P1_origin;
   _root.charSelect_P12 = _root.charSelect_P12_origin;
   _root.charSelect_P13 = _root.charSelect_P13_origin;
   _root.mode_role_P1 == _root.mode_role_P1_origin;
   _root.mode_role_P12 == _root.mode_role_P12_origin;
   _root.mode_role_P13 == _root.mode_role_P13_origin;
}
var face1 = _root.charSelect_P1;
if(face1 == "Iori" && _root.mode_role_P1 == 3)
{
   face1 = "Iori3";
}
if(face1 == "Zero" && _root.mode_role_P1 == 2)
{
   face1 = "Zero2";
}
if(face1 == "Orochi" && _root.mode_role_P1 == 2)
{
   face1 = "Orochi2";
}
var face2 = _root.charSelect_P2;
if(face2 == "Iori" && _root.mode_role_P2 == 3)
{
   face2 = "Iori3";
}
if(face2 == "Zero" && _root.mode_role_P2 == 2)
{
   face2 = "Zero2";
}
if(face2 == "Orochi" && _root.mode_role_P2 == 2)
{
   face2 = "Orochi2";
}
var face12 = _root.charSelect_P12;
if(face12 == "Iori" && _root.mode_role_P12 == 3)
{
   face12 = "Iori3";
}
if(face12 == "Zero" && _root.mode_role_P12 == 2)
{
   face12 = "Zero2";
}
if(face12 == "Orochi" && _root.mode_role_P12 == 2)
{
   face12 = "Orochi2";
}
var face22 = _root.charSelect_P22;
if(face22 == "Iori" && _root.mode_role_P22 == 3)
{
   face22 = "Iori3";
}
if(face22 == "Zero" && _root.mode_role_P22 == 2)
{
   face22 = "Zero2";
}
if(face22 == "Orochi" && _root.mode_role_P22 == 2)
{
   face22 = "Orochi2";
}
var face13 = _root.charSelect_P13;
if(face13 == "Iori" && _root.mode_role_P13 == 3)
{
   face13 = "Iori3";
}
if(face13 == "Zero" && _root.mode_role_P13 == 2)
{
   face13 = "Zero2";
}
if(face13 == "Orochi" && _root.mode_role_P13 == 2)
{
   face13 = "Orochi2";
}
var face23 = _root.charSelect_P23;
if(face23 == "Iori" && _root.mode_role_P23 == 3)
{
   face23 = "Iori3";
}
if(face23 == "Zero" && _root.mode_role_P23 == 2)
{
   face23 = "Zero2";
}
if(face23 == "Orochi" && _root.mode_role_P23 == 2)
{
   face23 = "Orochi2";
}
name_p1.gotoAndStop(face1);
name_p2.gotoAndStop(face2);
if(_level0.moreVs == true)
{
   name_p12.gotoAndStop(face12);
}
else
{
   name_p12.gotoAndStop("none");
}
if(_level0.moreVs3V3 == true)
{
   name_p13.gotoAndStop(face13);
}
else
{
   name_p13.gotoAndStop("none");
}
if(_level0.player_type == "1PVSCOM" && ((_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8) && _level0.moreVs3V3 != true || (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && _level0.moreVs3V3 == true) || _level0.moreVs != true)
{
   name_p22.gotoAndStop("none");
}
else
{
   name_p22.gotoAndStop(face22);
}
if(_level0.player_type == "1PVSCOM" && (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && _level0.moreVs3V3 == true || _level0.moreVs3V3 != true)
{
   name_p23.gotoAndStop("none");
}
else
{
   name_p23.gotoAndStop(face23);
}
if(_root.mode_role_P1 > 1)
{
   face1 = _root.charSelect_P1 + _root.mode_role_P1;
}
if(_root.mode_role_P2 > 1)
{
   face2 = _root.charSelect_P2 + _root.mode_role_P2;
}
if(_root.mode_role_P12 > 1)
{
   face12 = _root.charSelect_P12 + _root.mode_role_P12;
}
if(_root.mode_role_P22 > 1)
{
   face22 = _root.charSelect_P22 + _root.mode_role_P22;
}
if(_root.mode_role_P13 > 1)
{
   face13 = _root.charSelect_P13 + _root.mode_role_P13;
}
if(_root.mode_role_P23 > 1)
{
   face23 = _root.charSelect_P23 + _root.mode_role_P23;
}
face_p1.gotoAndStop(face1);
face_p2.gotoAndStop(face2);
face_p12.gotoAndStop(face12);
face_p22.gotoAndStop(face22);
face_p13.gotoAndStop(face13);
face_p23.gotoAndStop(face23);
