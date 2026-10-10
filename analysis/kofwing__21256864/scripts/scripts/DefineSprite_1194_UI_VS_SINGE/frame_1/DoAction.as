play();
this._visible = false;
stopAllSounds();
if(_level0.player_type == "1PVSCOM")
{
   _root.charSelect_P1 = _root.charSelect_P1_origin;
   _root.mode_role_P1 == _root.mode_role_P1_origin;
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
name_p1.gotoAndStop(face1);
name_p2.gotoAndStop(face2);
if(_root.mode_role_P1 > 1)
{
   face1 = _root.charSelect_P1 + _root.mode_role_P1;
}
if(_root.mode_role_P2 > 1)
{
   face2 = _root.charSelect_P2 + _root.mode_role_P2;
}
face_p1.gotoAndStop(face1);
face_p2.gotoAndStop(face2);
