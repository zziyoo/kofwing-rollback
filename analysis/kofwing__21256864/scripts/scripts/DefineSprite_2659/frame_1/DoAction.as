function gotoBG(_bgID)
{
   bgID = _bgID;
   loadStage();
}
function loadStage()
{
   bgID = stageNameArray[stagePonit];
   var _loc2_;
   var _loc1_;
   if(!_level0.isLoadStage)
   {
      stage_mc = loader.attachMovie("stage_" + bgID,"stage_mc",depth);
      stage_mc.nextFrame();
      gotoAndStop("load");
      play();
   }
   else
   {
      _loc2_ = new MovieClipLoader();
      _loc1_ = new Object();
      _loc1_.onLoadInit = function(target_mc)
      {
         target_mc.mc.nextFrame();
         gotoAndStop("load");
         play();
      };
      _loc2_.addListener(_loc1_);
      _loc2_.loadClip("stage/" + bgID + ".swf",loader);
   }
   _level0.bgID = bgID;
}
function nextStage()
{
   stagePonit++;
   if(stagePonit == stageNameArray.length)
   {
      stagePonit = stageNameArray.length - 1;
      return undefined;
   }
   loadStage();
}
function prevStage()
{
   stagePonit--;
   if(stagePonit == -1)
   {
      stagePonit = 0;
      return undefined;
   }
   loadStage();
}
stop();
var stage_num = loader._totalframes;
var depth = 100;
var bgMapping = _level0.bgArray;
var stageNameArray = new Array();
for(var i in bgMapping)
{
   stageNameArray.unshift(bgMapping[i]);
}
var bgID;
var stagePonit = 0;
stagePonit = int(Math.random() * stageNameArray.length);
loadStage();
var stage_mc;
