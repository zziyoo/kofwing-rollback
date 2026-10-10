function init(bgInf)
{
   stageArray = bgInf.stageBG.split(",");
   _level0.bgArray = stageArray.concat();
   var _loc2_;
   var _loc1_;
   for(bgName in bgInf)
   {
      _loc2_ = bgInf[bgName];
      if(bgName == "stageBG")
      {
         break;
      }
      if(typeof _loc2_ == "string")
      {
         _level0.bgMapping[bgName] = _loc2_;
         _loc1_ = 0;
         while(_loc1_ < stageArray.length)
         {
            if(stageArray[_loc1_] == _loc2_)
            {
               stageArray.splice(_loc1_,1);
               break;
            }
            _loc1_ = _loc1_ + 1;
         }
      }
      else
      {
         _level0.bgMapping[name] = getRandomBg();
      }
   }
   for(var _loc4_ in _level0.bgMapping)
   {
   }
}
function getDefault()
{
   bgInf = _root.bgMappingDefault;
   init(bgInf);
}
function getRandomBg()
{
   var _loc3_ = stageArray.length;
   var _loc2_ = int(Math.random() * _loc3_);
   var _loc1_ = stageArray[_loc2_];
   stageArray.splice(_loc2_,1);
   if(!_loc1_)
   {
      _loc1_ = _level0.bgArray[0];
   }
   return _loc1_;
}
var bgInf = new LoadVars();
var stageArray = new Array();
var bgMapping = new Object();
_level0.bgArray = [];
_level0.bgMapping = {};
bgInf.onLoad = function(success)
{
   if(success)
   {
      init(this);
   }
   else
   {
      getDefault();
   }
};
