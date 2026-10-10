class FWAd_AS2
{
   static var frameworkLoader;
   static var intervalId;
   static var mcl;
   static var showing;
   static var swfDomain = "gamecfg.flashwing.net";
   static var swfFolder = "http://" + FWAd_AS2.swfDomain + "/fwcfg/";
   static var frameworkSWFPath = FWAd_AS2.swfFolder + "FrameworkAS2.swf";
   static var AD_TYPE_LOADING = "loading";
   static var AD_TYPE_CONTAINER = "container";
   static var adValues = {};
   function FWAd_AS2()
   {
   }
   static function showAd(_adValues)
   {
      FWAd_AS2.close();
      System.security.allowDomain(FWAd_AS2.swfDomain);
      System.security.allowInsecureDomain(FWAd_AS2.swfDomain);
      if(_adValues.adType == FWAd_AS2.AD_TYPE_LOADING)
      {
         if(FWAd_AS2.showing)
         {
            return undefined;
         }
      }
      FWAd_AS2.reset();
      for(var _loc2_ in _adValues)
      {
         FWAd_AS2.adValues[_loc2_] = _adValues[_loc2_];
      }
      var _loc3_;
      if(FWAd_AS2.adValues.container)
      {
         FWAd_AS2.showing = true;
         if(!FWAd_AS2.adValues.onAdFinished)
         {
            if(FWAd_AS2.adValues.onClickCloseBtn)
            {
               FWAd_AS2.adValues.onAdFinished = FWAd_AS2.adValues.onClickCloseBtn;
            }
            else
            {
               FWAd_AS2.adValues.onAdFinished = FWAd_AS2.adValues.onClickStartBtn;
            }
         }
         _loc3_ = FWAd_AS2.adValues.container.getNextHighestDepth();
         FWAd_AS2.frameworkLoader = FWAd_AS2.adValues.container.createEmptyMovieClip("frameworkLoader",_loc3_ <= 0 ? 0 : _loc3_);
         FWAd_AS2.frameworkLoader.createEmptyMovieClip("content",0);
         FWAd_AS2.mcl = new MovieClipLoader();
         FWAd_AS2.mcl.onLoadInit = function()
         {
            FWAd_AS2.loadFrameworkComplete();
         };
         FWAd_AS2.mcl.onLoadError = function()
         {
            FWAd_AS2.loadFrameworkError();
         };
         FWAd_AS2.mcl.loadClip(FWAd_AS2.frameworkSWFPath,FWAd_AS2.frameworkLoader.content);
      }
   }
   static function reset()
   {
      FWAd_AS2.adValues = {x:int(FWAd_AS2.adValues.x),y:int(FWAd_AS2.adValues.y),wid:FWAd_AS2.adValues.wid,hei:FWAd_AS2.adValues.hei,id:FWAd_AS2.adValues.id,adType:FWAd_AS2.AD_TYPE_CONTAINER};
      FWAd_AS2.showing = false;
      clearInterval(FWAd_AS2.intervalId);
      if(FWAd_AS2.frameworkLoader)
      {
         FWAd_AS2.frameworkLoader.removeMovieClip();
         FWAd_AS2.frameworkLoader = null;
      }
   }
   static function loadFrameworkComplete()
   {
      FWAd_AS2.frameworkLoader.content.framework.init(FWAd_AS2);
   }
   static function loadFrameworkError()
   {
      FWAd_AS2.intervalId = setInterval(FWAd_AS2.checkGameLoadComplete,100);
   }
   static function checkGameLoadComplete()
   {
      var _loc1_ = FWAd_AS2.adValues.container;
      while(_loc1_)
      {
         if(_loc1_._parent == null)
         {
            if(_loc1_.getBytesLoaded() > 0 && _loc1_.getBytesLoaded() == _loc1_.getBytesTotal())
            {
               if(FWAd_AS2.adValues.onAdFinished)
               {
                  FWAd_AS2.adValues.onAdFinished();
               }
               FWAd_AS2.reset();
            }
            return undefined;
         }
         _loc1_ = _loc1_._parent;
      }
   }
   static function close()
   {
      if(FWAd_AS2.adValues.container && FWAd_AS2.frameworkLoader && FWAd_AS2.frameworkLoader._parent == FWAd_AS2.adValues.container)
      {
         FWAd_AS2.frameworkLoader.removeMovieClip();
      }
   }
   static function getValue(objName, thisObj)
   {
      return FWAd_AS2.getObj(objName.split("."),thisObj);
   }
   static function setValue(objName, value, thisObj)
   {
      var _loc1_ = objName.split(".");
      var _loc3_;
      var _loc2_;
      if(_loc1_.length)
      {
         _loc3_ = _loc1_.pop();
         _loc2_ = FWAd_AS2.getObj(_loc1_,thisObj);
         if(_loc2_)
         {
            _loc2_[_loc3_] = value;
         }
      }
   }
   static function getObj(objNameArr, thisObj)
   {
      if(objNameArr.length)
      {
         var obj;
         if(thisObj)
         {
            obj = thisObj[objNameArr.shift()];
         }
         else
         {
            var defCache = "";
            while(objNameArr.length)
            {
               var defStr = objNameArr.shift();
               obj = eval(defCache + defStr);
               if(obj)
               {
                  break;
               }
               defCache += defStr + ".";
            }
         }
         if(obj)
         {
            while(objNameArr.length)
            {
               obj = obj[objNameArr.shift()];
            }
         }
         return obj;
      }
      return null;
   }
}
