select_mc.gotoAndPlay("normal");
select_mc2.gotoAndPlay("normal");
centerArea.gotoAndStop("stop");
faceArea_p1.gotoAndStop("stop");
faceArea_p2.gotoAndStop("stop");
faceArea_p11.gotoAndStop("stop");
faceArea_p22.gotoAndStop("stop");
icon_vs.gotoAndStop("stop");
select_mc.player.init(null,"b",face_p1,name_mc1,this,mode_p1,fromTxt_mc1,"p1");
if(_level0.P2_type == "cpu")
{
   select_mc2.player.init(null,"a4",face_p2,name_mc2,this,mode_p2,fromTxt_mc2,"p2");
}
if(_level0.stageID == 3 && _level0.moreVs3V3 != true)
{
   gotoAndStop("boss");
   play();
}
if(_level0.stageID == 7 && _level0.moreVs3V3 != true)
{
   gotoAndStop("boss");
   play();
}
if(_level0.stageID == 8 && _level0.moreVs3V3 != true)
{
   gotoAndStop("boss");
   play();
}
if(_level0.stageID == 2 && _level0.moreVs3V3 == true)
{
   gotoAndStop("boss");
   play();
}
if(_level0.stageID == 5 && _level0.moreVs3V3 == true)
{
   gotoAndStop("boss");
   play();
}
if(_level0.stageID == 6 && _level0.moreVs3V3 == true)
{
   gotoAndStop("boss");
   play();
}
