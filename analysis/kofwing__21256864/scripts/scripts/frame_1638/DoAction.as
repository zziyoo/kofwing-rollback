function loadMusic()
{
   if(BGM == false)
   {
      bgmControl_mc.loadSound(blank);
      return undefined;
   }
   var _loc1_;
   var _loc2_;
   if(player_type != "1PVSCOM")
   {
      _loc1_ = Math.random();
      if(_loc1_ > 0.5)
      {
         _loc2_ = charSelect_P1 + mode_role_P1.toString();
         bgmControl_mc.loadSound(_loc2_,charSelect_P1);
      }
      else
      {
         _loc2_ = charSelect_P2 + mode_role_P2.toString();
         bgmControl_mc.loadSound(_loc2_,charSelect_P2);
      }
   }
   else
   {
      _loc2_ = charSelect_P2 + mode_role_P2.toString();
      bgmControl_mc.loadSound(_loc2_,charSelect_P2);
   }
}
stopAllSounds();
firstPlay = false;
var slowSound_mc = createEmptyMovieClip("slowSound_mc",depth_slowSound);
if(!isLoadStage)
{
   if(player_type == "1PVSCOM")
   {
      bgID = bgMapping[charSelect_P2];
   }
   stage_mc = attachMovie("stage_" + bgID,"stage_mc",depth_stage);
}
else
{
   stop();
   if(player_type == "1PVSCOM")
   {
      if(mode_role_P2 == 1)
      {
         bgID = bgMapping[charSelect_P2];
      }
      else if(bgMapping[charSelect_P2 + mode_role_P2.toString()] != undefined)
      {
         bgID = bgMapping[charSelect_P2 + mode_role_P2.toString()];
      }
      else
      {
         bgID = bgMapping[charSelect_P2];
      }
   }
   stage_mc = createEmptyMovieClip("stage_mc",depth_stage);
   var stage_loader = new MovieClipLoader();
   var loadListener1 = new Object();
   loadListener1.onLoadInit = function(target_mc)
   {
      play();
   };
   stage_loader.addListener(loadListener1);
   stage_loader.loadClip("stage/" + bgID + ".swf",stage_mc);
}
loadMusic();
