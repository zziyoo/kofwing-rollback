function init()
{
   var _loc2_ = 0;
   var _loc1_;
   while(true)
   {
      _loc1_ = soundInf["stage" + _loc2_];
      if(_loc1_ == undefined)
      {
         break;
      }
      soundArray[_loc2_] = _loc1_;
      _loc2_ = _loc2_ + 1;
   }
}
function loadSound(char, chars)
{
   var _loc2_ = soundInf[char];
   var _loc3_ = soundInf[chars];
   if(_loc2_ == undefined)
   {
      for(var _loc4_ in soundArray)
      {
         if(soundArray[_loc4_] != undefined)
         {
            _loc2_ = soundArray[_loc4_];
            break;
         }
      }
      for(_loc4_ in soundArray)
      {
         if(soundArray[_loc4_] != undefined)
         {
            _loc3_ = soundArray[_loc4_];
            break;
         }
      }
   }
   stageSound.onLoad = function(success)
   {
      if(success != true)
      {
         this.attachSound("blank");
      }
   };
   if(_loc2_ != undefined)
   {
      stageSound.loadSound("sound/" + _loc2_,false);
   }
   else
   {
      stageSound.loadSound("sound/" + _loc3_,false);
   }
}
function playSound()
{
   stageSound.setVolume(_level0.BgmVolume);
   stageSound.start(0,1000);
}
_visible = false;
var soundInf = new LoadVars();
var soundArray = new Array();
var stageSound = new Sound();
soundInf.onLoad = function(success)
{
   if(success)
   {
      _level0.out("soundInf:" + soundInf);
   }
};
