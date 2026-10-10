var mc_list = _level0.mc_list;
var stageID = _level0.stageID;
var cpu_list = _level0.cpu_list;
var cpuChar;
var cpuChar_3V3;
var cpuChar2;
var cpuChar2_3V3;
var cpuChar3;
var char;
var char_3V3;
var char2;
var char2_3V3;
var char3;
var cpuMode;
var cpuMode_3V3;
var cpuMode2;
var cpuMode2_3V3;
var cpuMode3;
cpuChar = cpu_list[stageID].split("_");
char = cpuChar[0];
cpuMode = Number(cpuChar[1]);
cpuChar2 = cpu_list[stageID + 9].split("_");
char2 = cpuChar2[0];
cpuMode2 = Number(cpuChar2[1]);
if(stageID == 0)
{
   cpuChar_3V3 = cpu_list[0].split("_");
   cpuChar2_3V3 = cpu_list[1].split("_");
   cpuChar3 = cpu_list[2].split("_");
}
if(stageID == 1)
{
   cpuChar_3V3 = cpu_list[3].split("_");
   cpuChar2_3V3 = cpu_list[4].split("_");
   cpuChar3 = cpu_list[5].split("_");
}
if(stageID == 2)
{
   cpuChar_3V3 = cpu_list[6].split("_");
   cpuChar2_3V3 = "";
   cpuChar3 = "";
}
if(stageID == 3)
{
   cpuChar_3V3 = cpu_list[9].split("_");
   cpuChar2_3V3 = cpu_list[10].split("_");
   cpuChar3 = cpu_list[11].split("_");
}
if(stageID == 4)
{
   cpuChar_3V3 = cpu_list[12].split("_");
   cpuChar2_3V3 = cpu_list[13].split("_");
   cpuChar3 = cpu_list[14].split("_");
}
if(stageID == 5)
{
   cpuChar_3V3 = cpu_list[7].split("_");
   cpuChar2_3V3 = "";
   cpuChar3 = "";
}
if(stageID == 6)
{
   cpuChar_3V3 = cpu_list[8].split("_");
   cpuChar2_3V3 = "";
   cpuChar3 = "";
}
char_3V3 = cpuChar_3V3[0];
cpuMode_3V3 = Number(cpuChar_3V3[1]);
char2_3V3 = cpuChar2_3V3[0];
cpuMode2_3V3 = Number(cpuChar2_3V3[1]);
char3 = cpuChar3[0];
cpuMode3 = Number(cpuChar3[1]);
var mcName = mc_list[char];
var mcName_3V3 = mc_list[char_3V3];
if(char == "Iori" && cpuMode == 3)
{
   mcName = mc_list[char + cpuMode];
}
if(char_3V3 == "Iori" && cpuMode_3V3 == 3)
{
   mcName_3V3 = mc_list[char_3V3 + cpuMode_3V3];
}
var mcName2 = mc_list[char2];
var mcName2_3V3 = mc_list[char2_3V3];
var mcName3 = mc_list[char3];
if(_level0.moreVs3V3 != true)
{
   _parent.select_mc2.player.selectMode = cpuMode;
   _parent.select_mc2.player.selectNext(mcName,cpuMode);
}
if(_level0.moreVs == true)
{
   if(_level0.moreVs3V3 != true && !(_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8))
   {
      setTimeout(function()
      {
         _parent.select_mc2.player.selectMode = cpuMode2;
         _parent.select_mc2.player.selectNext(mcName2,cpuMode2);
      }
      ,1000);
   }
   else if(_level0.moreVs3V3 == true)
   {
      _parent.select_mc2.player.selectMode = cpuMode_3V3;
      _parent.select_mc2.player.selectNext(mcName_3V3,cpuMode_3V3);
      if(!(_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6))
      {
         setTimeout(function()
         {
            _parent.select_mc2.player.selectMode = cpuMode2_3V3;
            _parent.select_mc2.player.selectNext(mcName2_3V3,cpuMode2_3V3);
         }
         ,750);
         setTimeout(function()
         {
            _parent.select_mc2.player.selectMode = cpuMode3;
            _parent.select_mc2.player.selectNext(mcName3,cpuMode3);
         }
         ,1500);
      }
      else
      {
         _parent.select_mc2.player.selectP1 = true;
         _parent.select_mc2.player.selectP2 = true;
         _parent.select_mc2.player.selectOK();
      }
   }
}
