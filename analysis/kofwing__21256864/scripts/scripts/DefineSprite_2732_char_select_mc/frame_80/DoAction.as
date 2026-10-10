function getData()
{
   char_p1 = select_mc.player.selectRole;
   char_p2 = select_mc2.player.selectRole;
   char_p12 = select_mc.player.selectRole2;
   char_p22 = select_mc2.player.selectRole2;
   char_p13 = select_mc.player.selectRole3;
   char_p23 = select_mc2.player.selectRole3;
   mode_p1 = select_mc.player.Mode1;
   mode_p2 = select_mc2.player.Mode1;
   mode_p12 = select_mc.player.Mode2;
   mode_p22 = select_mc2.player.Mode2;
   mode_p13 = select_mc.player.Mode3;
   mode_p23 = select_mc2.player.Mode3;
   var _loc1_ = {char_p1:char_p1,char_p2:char_p2,mode_p1:mode_p1,mode_p2:mode_p2,mode2_p1:owner.mode2_p1,mode2_p2:owner.mode2_p2,mode3_p1:mode3_p1,mode3_p2:mode3_p2,char_p12:char_p12,char_p22:char_p22,mode_p12:mode_p12,mode_p22:mode_p22,char_p13:char_p13,char_p23:char_p23,mode_p13:mode_p13,mode_p23:mode_p23};
   return _loc1_;
}
face_p1.play();
face_p2.play();
up_mc.play();
down_mc.play();
select_mc.play();
select_mc2.play();
icon_vs.play();
faceArea_p1.play();
faceArea_p2.play();
faceArea_p11.play();
faceArea_p22.play();
centerArea.play();
var selectData = getData();
if(_root.netPlay_bool && _level0.player_type == "1PVS2P")
{
   gotoAndStop("NetConnection");
   play();
}
