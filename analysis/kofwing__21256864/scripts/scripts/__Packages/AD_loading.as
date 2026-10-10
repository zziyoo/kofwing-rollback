class AD_loading extends AD
{
   var adArray;
   var adID;
   var ad_mc;
   var ad_order;
   var ad_showNumber;
   var loadOK;
   var my_xml;
   var sendvar;
   var timerLoad;
   var timer_play;
   var url_count;
   var url_xml;
   var xmlOnload;
   var isLoaded = false;
   function AD_loading()
   {
      super();
      this.adArray = new Array();
      this.sendvar = new LoadVars();
   }
   function init()
   {
      this.adID = 0;
      this.url_xml = _level0.adPath + "/" + _level0.game + "/" + "ad_loading.xml";
      this.url_count = _level0.adPath + "/" + _level0.game + "/" + "count.asp";
      this.xmlOnload = function()
      {
         this.paseXML(this.my_xml);
         if(this.ad_order == 0)
         {
            this.adArray = this.disOrder(this.adArray);
         }
         this.loadAD(this.adID);
      };
      this.loadXML(this.url_xml);
      this.sendvar.onLoad = function(success)
      {
         if(!success)
         {
         }
      };
      this.timer_play = setInterval(this,"checkLoad",this.time_play);
   }
   function loadXML(url)
   {
      this.my_xml = new XML();
      this.my_xml.ignoreWhite = true;
      var owner = this;
      this.my_xml.onLoad = function(success)
      {
         if(success)
         {
            owner.xmlOnload();
         }
         else
         {
            owner.loadOK();
         }
      };
      this.my_xml.load(url);
   }
   function paseXML(my_xml)
   {
      this.ad_order = Number(my_xml.firstChild.attributes.order);
      this.ad_showNumber = Number(my_xml.firstChild.attributes.showNumber);
      var _loc5_ = my_xml.firstChild.childNodes;
      var _loc4_ = 0;
      var _loc3_;
      var _loc2_;
      while(_loc4_ < _loc5_.length)
      {
         _loc3_ = _loc5_[_loc4_];
         _loc2_ = new Object();
         _loc2_.file = _loc3_.childNodes[0].firstChild.nodeValue;
         _loc2_.width = _loc3_.childNodes[1].firstChild.nodeValue;
         _loc2_.height = _loc3_.childNodes[2].firstChild.nodeValue;
         _loc2_.time = Number(_loc3_.childNodes[3].firstChild.nodeValue * 1000);
         this.adArray.push(_loc2_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function disOrder(_adArray)
   {
      var _loc1_ = new Array();
      for(var _loc5_ in _adArray)
      {
         _loc1_[_loc5_] = _adArray[_loc5_];
      }
      var _loc4_ = new Array();
      var _loc2_;
      for(_loc5_ in _loc1_)
      {
         _loc2_ = int(Math.random() * _loc1_.length);
         _loc4_.push(_loc1_[_loc2_]);
         _loc1_.splice(_loc2_,1);
      }
      return _loc4_;
   }
   function loadAD(id)
   {
      var adObj = this.adArray[id];
      this.ad_mc._lockroot = true;
      this.ad_mc._x = (- adObj.width) / 2;
      this.ad_mc._y = (- adObj.height) / 2;
      var _loc2_ = new Object();
      var _loc3_ = new MovieClipLoader();
      var owner = this;
      _loc2_.onLoadComplete = function()
      {
         if(!adObj.time)
         {
            adObj.time = 5000;
         }
         owner.timerLoad = setInterval(owner,"loadNext",adObj.time);
         System.security.allowDomain(owner.ad_mc._url);
         owner.ad_onLoad();
         owner.isLoaded = true;
      };
      _loc2_.onLoadError = function()
      {
         owner.timerLoad = setInterval(owner,"loadNext",1000);
      };
      _loc3_.addListener(_loc2_);
      _loc3_.loadClip(adObj.file,this.ad_mc);
   }
   function loadNext()
   {
      if(_root.getBytesLoaded() == _root.getBytesTotal() && this.adID + 1 >= this.ad_showNumber)
      {
         this.loadOK();
         return undefined;
      }
      clearInterval(this.timerLoad);
      this.adID = this.adID + 1;
      if(this.adID == this.adArray.length)
      {
         this.adID = 0;
      }
      this.loadAD(this.adID);
   }
   function checkLoad()
   {
      if(!this.isLoaded)
      {
         this.loadOK();
      }
      clearInterval(this.timer_play);
   }
}
