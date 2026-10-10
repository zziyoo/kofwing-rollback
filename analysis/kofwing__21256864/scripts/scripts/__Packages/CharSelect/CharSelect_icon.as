class CharSelect.CharSelect_icon extends MovieClip
{
   var LoaderMC;
   var faceMC;
   var fromTxt_mc;
   var keyObj;
   var modeMC;
   var name_mc;
   var onEnterFrame;
   var onKeyDown;
   var onKeyUp;
   var playerType;
   var selectDelay;
   var selectOK_char;
   var selectRanRole;
   var selectRanRole2;
   var selectRanRole3;
   var selectRole;
   var selectRole2;
   var selectRole3;
   var select_now;
   var start_random = true;
   var selectMode = 0;
   var selectMode2 = 0;
   var selectMode3 = 0;
   var Mode1 = 0;
   var Mode2 = 0;
   var Mode3 = 0;
   var selectP1 = false;
   var selectP2 = false;
   var selectCPU1 = true;
   var selectCPU2 = false;
   var Mode2_cpu = 0;
   static var selectedNum = 0;
   var nonActive = [];
   var nameList = ["Kyo","KyoW","Iori","K","Kula","Mai","Athena","Ryo","Ryu","Chunli","Moriya","Haohmaru","Terry","Ash","Nameless","Rugal","Orochi","Zero","Igniz","Iori3","Kusanagi","Kim","Andy","Goenitz","Krizalid","Oswald"];
   var nameListNormal = ["Kyo","KyoW","Iori","K","Kula","Mai","Athena","Ryo","Ryu","Chunli","Moriya","Haohmaru","Terry","Ash","Nameless","Kusanagi","Kim","Andy","Oswald"];
   var zeroKeyNum = 0;
   var KusanagiKeyNum = 0;
   var namelessKeyNum = 0;
   var GoenitzKeyNum = 0;
   var selectnum = 0;
   function CharSelect_icon()
   {
      super();
      Key.addListener(this);
   }
   function init($keyObj, $select_now, $faceMC, $name_mc, $LoaderMC, $modeMC, $fromTxt_mc, $playerType)
   {
      this.keyObj = $keyObj;
      this.faceMC = $faceMC;
      this.LoaderMC = $LoaderMC;
      this.name_mc = $name_mc;
      this.fromTxt_mc = $fromTxt_mc;
      this.modeMC = $modeMC;
      this.playerType = $playerType;
      this.goto($select_now);
      this.showFace(this.select_now.$role + this.select_now.$type);
      this.showName(this.select_now.$name,this.select_now.$type);
      _level0.canSelect = true;
      if(_level0.moreVs3V3 == true)
      {
         _level0.selectMax = 3;
      }
      else if(_level0.moreVs == true)
      {
         _level0.selectMax = 2;
      }
      else if(_level0.moreVs != true)
      {
         _level0.selectMax = 1;
      }
      if(this.playerType == "p1")
      {
         _level0.selectCount1P = 0;
      }
      if(this.playerType == "p2")
      {
         _level0.selectCount2P = 0;
      }
      this.onKeyDown = this.char_select;
   }
   function initKey($keyObj)
   {
      this.keyObj = $keyObj;
   }
   function selectNext(next, nextMode)
   {
      this.Mode2_cpu = nextMode;
      this.gotoCPU(next,nextMode);
      this.showFace(this.select_now.$role + nextMode);
      this.showName(this.select_now.$role,nextMode);
      this.selectOK();
   }
   function noSelectResoume()
   {
      if(!_level0.canSelect1P)
      {
         _level0.canSelect1P = true;
      }
      if(!_level0.canSelect2P)
      {
         _level0.canSelect2P = true;
      }
   }
   function char_select()
   {
      if(!_level0.canSelect)
      {
         return undefined;
      }
      if(!_level0.canSelect1P && this.playerType == "p1")
      {
         return undefined;
      }
      if(!_level0.canSelect2P && this.playerType == "p2")
      {
         return undefined;
      }
      clearInterval(this.selectDelay);
      this.selectDelay = setInterval(this,"noSelectResoume",500);
      var _loc5_;
      if(Key.isDown(this.keyObj.p))
      {
         if(this.select_now.canSelect == false)
         {
            return undefined;
         }
         if(this.playerType == "p2")
         {
            _root.p2colormode = "normal";
         }
         else
         {
            _root.p1colormode = "normal";
         }
         this.selectOK();
         if(_level0.player_type == "1PVS2P")
         {
            if(this.playerType == "p2")
            {
               _level0.canSelect2P = false;
            }
            else
            {
               _level0.canSelect1P = false;
            }
         }
         this.onKeyUp = null;
         return undefined;
      }
      if(Key.isDown(this.keyObj.k))
      {
         if(this.select_now.canSelect == false)
         {
            return undefined;
         }
         if(this.select_now.canSelect == false)
         {
            return undefined;
         }
         if(this.playerType == "p2")
         {
            _root.p2colormode = "black";
         }
         else
         {
            _root.p1colormode = "black";
         }
         this.selectOK();
         if(_level0.player_type == "1PVS2P")
         {
            if(this.playerType == "p2")
            {
               _level0.canSelect2P = false;
            }
            else
            {
               _level0.canSelect1P = false;
            }
         }
         this.onKeyUp = null;
         return undefined;
      }
      if(Key.isDown(this.keyObj.p_l))
      {
         if(this.select_now.canSelect == false)
         {
            return undefined;
         }
         if(this.select_now.canSelect == false)
         {
            return undefined;
         }
         if(this.playerType == "p2")
         {
            _root.p2colormode = "blue";
         }
         else
         {
            _root.p1colormode = "blue";
         }
         this.selectOK();
         if(_level0.player_type == "1PVS2P")
         {
            if(this.playerType == "p2")
            {
               _level0.canSelect2P = false;
            }
            else
            {
               _level0.canSelect1P = false;
            }
         }
         this.onKeyUp = null;
         return undefined;
      }
      if(Key.isDown(this.keyObj.k_l))
      {
         if(this.select_now.canSelect == false)
         {
            return undefined;
         }
         if(this.select_now.canSelect == false)
         {
            return undefined;
         }
         if(this.playerType == "p2")
         {
            _root.p2colormode = "green";
         }
         else
         {
            _root.p1colormode = "green";
         }
         this.selectOK();
         if(_level0.player_type == "1PVS2P")
         {
            if(this.playerType == "p2")
            {
               _level0.canSelect2P = false;
            }
            else
            {
               _level0.canSelect1P = false;
            }
         }
         this.onKeyUp = null;
         return undefined;
      }
      var _loc6_;
      var _loc9_;
      var _loc8_;
      if(Key.isDown(this.keyObj.s))
      {
         if(this.select_now.$role == "random")
         {
            return undefined;
         }
         if(this.select_now.$role == "randomNormal")
         {
            return undefined;
         }
         if(this.select_now.img != "defaultVlue")
         {
            this.select_now.gotoAndStop(this.select_now.img);
         }
         var name1 = this.select_now.$role + this.select_now.$type;
         _loc6_ = "";
         _loc9_ = "Zero";
         if(this.select_now.$hasHidden)
         {
            _loc6_ = this.select_now.$role + "2";
            if(_loc6_ != "")
            {
               if(this.selectMode == 2)
               {
                  return undefined;
               }
               this.selectMode = 2;
               this.showFace(_loc6_);
               if(this.select_now.$role == "Zero" || this.select_now.$role == "Orochi")
               {
                  this.select_now.$type = 2;
                  this.showName(_loc6_,this.select_now.$type);
               }
               _loc8_ = function()
               {
                  if(Key.getCode() == this.keyObj.s)
                  {
                     this.showFace(name1);
                     if(this.select_now.$role == "Zero" || this.select_now.$role == "Orochi")
                     {
                        this.select_now.$type = 1;
                        this.showName(this.select_now.$role,this.select_now.$type);
                     }
                     this.select_now.gotoAndStop(this.select_now.$role);
                     this.selectMode = this.select_now.$type;
                     this.onKeyUp = null;
                  }
               };
               this.onKeyUp = _loc8_;
            }
            return undefined;
         }
         return undefined;
      }
      if(Key.isDown(this.keyObj.u))
      {
         _loc5_ = "up";
      }
      else if(Key.isDown(this.keyObj.d))
      {
         _loc5_ = "down";
      }
      else if(Key.isDown(this.keyObj.f))
      {
         _loc5_ = "right";
      }
      else if(Key.isDown(this.keyObj.b))
      {
         _loc5_ = "left";
      }
      else
      {
         if(this.select_now.$role == "random")
         {
            return undefined;
         }
         if(this.select_now.$role == "randomNormal")
         {
            return undefined;
         }
         if(!Key.isDown(this.keyObj.h))
         {
            return undefined;
         }
         _loc5_ = "yc";
      }
      delete this.onEnterFrame;
      var _loc4_ = this.getNext(_loc5_);
      if(_loc4_ == "none")
      {
         return undefined;
      }
      if(!(this._parent[_loc4_] instanceof MovieClip))
      {
         return undefined;
      }
      this.onKeyUp = null;
      this.goto(_loc4_);
      if(this.playerType == "p2")
      {
         if(_loc5_ == "left")
         {
            _loc5_ = "right";
         }
         else if(_loc5_ == "right")
         {
            _loc5_ = "left";
         }
      }
      var _loc7_;
      _loc7_ = this.select_now.$role + this.select_now.$type;
      this.showFace(_loc7_);
      var _loc3_ = 0;
      while(_loc3_ < this.nonActive.length)
      {
         if(_loc4_ == this.nonActive[_loc3_])
         {
            this.showFace("");
         }
         _loc3_ = _loc3_ + 1;
      }
      this.showName(this.select_now.$name,this.selectMode);
      if(this.select_now.localHint)
      {
         this.faceMC._alpha = 50;
         this.LoaderMC.downloadMsg._visible = true;
      }
      else
      {
         this.faceMC._alpha = 100;
         this.LoaderMC.downloadMsg._visible = false;
      }
   }
   function getNext(dir)
   {
      var _loc2_ = this.select_now.posObj[dir];
      if(_loc2_ != "" && _loc2_ != undefined)
      {
         return _loc2_;
      }
      return "none";
   }
   function goto(next)
   {
      this.select_now = this._parent[next];
      this._x = this.select_now._x;
      this._y = this.select_now._y;
      this.selectMode = this.select_now.$type;
   }
   function gotoCPU(next, nextMode)
   {
      this.select_now = this._parent[next];
      this._x = this.select_now._x;
      this._y = this.select_now._y;
      this.selectMode = nextMode;
   }
   function randomSelect()
   {
      var counter = 0;
      var bb = false;
      var bb2 = false;
      var bb3 = false;
      this.onEnterFrame = function()
      {
         counter++;
         if(counter != 1)
         {
            return undefined;
         }
         var _loc11_ = Math.random();
         _level0.randomSelect_snd.start();
         if(_level0.ranCharSelectNum2)
         {
            _level0.randomSelect_snd.start();
         }
         if(_level0.ranCharSelectNum3)
         {
            _level0.randomSelect_snd.start();
         }
         counter = 0;
         var _loc4_ = this.nameList[int(Math.random() * this.nameList.length)];
         var _loc5_ = this.nameList[int(Math.random() * this.nameList.length)];
         var _loc7_ = this.nameList[int(Math.random() * this.nameList.length)];
         var _loc6_ = Math.random();
         var _loc3_ = Math.random();
         var _loc2_ = Math.random();
         if(_loc6_ > 0.5)
         {
            _loc6_ = 2;
         }
         else
         {
            _loc6_ = 1;
         }
         if(_loc3_ > 0.5)
         {
            _loc3_ = 2;
         }
         else
         {
            _loc3_ = 1;
         }
         if(_loc2_ > 0.5)
         {
            _loc2_ = 2;
         }
         else
         {
            _loc2_ = 1;
         }
         if(_loc4_ == "Iori3")
         {
            bb = true;
            _loc6_ = 3;
         }
         else if(_loc4_ == "Nameless" || _loc4_ == "Kusanagi" || _loc4_ == "Andy" || _loc4_ == "Goenitz" || _loc4_ == "Oswald")
         {
            _loc6_ = 1;
            bb = false;
         }
         else
         {
            bb = false;
         }
         if(_loc5_ == "Iori3")
         {
            bb2 = true;
            _loc3_ = 3;
         }
         else if(_loc5_ == "Nameless" || _loc5_ == "Kusanagi" || _loc5_ == "Andy" || _loc5_ == "Goenitz" || _loc3_ == "Oswald")
         {
            _loc3_ = 1;
            bb2 = false;
         }
         else
         {
            bb2 = false;
         }
         if(_loc2_ == "Iori3")
         {
            bb3 = true;
            _loc2_ = 3;
         }
         else if(_loc2_ == "Nameless" || _loc2_ == "Kusanagi" || _loc2_ == "Andy" || _loc2_ == "Goenitz" || _loc2_ == "Oswald")
         {
            _loc2_ = 1;
            bb3 = false;
         }
         else
         {
            bb3 = false;
         }
         var _loc10_;
         if(bb == true)
         {
            _loc10_ = "Iori" + _loc6_.toString();
            this.faceMC.head_loader.mc.gotoAndStop(_loc10_);
            this.name_mc.gotoAndStop("Iori3");
            this.selectRanRole = "Iori";
            this.selectMode = 3;
         }
         else
         {
            _loc10_ = _loc4_ + _loc6_.toString();
            this.faceMC.head_loader.mc.gotoAndStop(_loc10_);
            this.name_mc.gotoAndStop(_loc4_);
            this.selectRanRole = _loc4_;
            this.selectMode = _loc6_;
         }
         var _loc8_;
         if(bb2 == true)
         {
            _loc8_ = "Iori" + _loc3_.toString();
            this.faceMC.head_loader.mc.gotoAndStop(_loc8_);
            this.name_mc.gotoAndStop("Iori3");
            this.selectRanRole2 = "Iori";
            this.selectMode2 = 3;
         }
         else
         {
            _loc8_ = _loc5_ + _loc3_.toString();
            this.faceMC.head_loader.mc.gotoAndStop(_loc8_);
            this.name_mc.gotoAndStop(_loc5_);
            this.selectRanRole2 = _loc5_;
            this.selectMode2 = _loc3_;
         }
         var _loc9_;
         if(bb3 == true)
         {
            _loc9_ = "Iori" + _loc2_.toString();
            this.faceMC.head_loader.mc.gotoAndStop(_loc9_);
            this.name_mc.gotoAndStop("Iori3");
            this.selectRanRole2 = "Iori";
            this.selectMode3 = 3;
         }
         else
         {
            _loc9_ = _loc7_ + _loc2_.toString();
            this.faceMC.head_loader.mc.gotoAndStop(_loc9_);
            this.name_mc.gotoAndStop(_loc7_);
            this.selectRanRole3 = _loc7_;
            this.selectMode3 = _loc2_;
         }
      };
   }
   function randomSelectNormal()
   {
      var counter = 0;
      this.onEnterFrame = function()
      {
         counter++;
         if(counter != 1)
         {
            return undefined;
         }
         _level0.randomSelect_snd.start();
         if(_level0.ranCharSelectNNum2)
         {
            _level0.randomSelect_snd.start();
         }
         if(_level0.ranCharSelectNNum3)
         {
            _level0.randomSelect_snd.start();
         }
         counter = 0;
         var _loc4_ = this.nameListNormal[int(Math.random() * this.nameListNormal.length)];
         var _loc3_ = this.nameListNormal[int(Math.random() * this.nameListNormal.length)];
         var _loc7_ = this.nameListNormal[int(Math.random() * this.nameListNormal.length)];
         var _loc5_ = Math.random();
         var _loc6_ = Math.random();
         var _loc2_ = Math.random();
         if(_loc5_ > 0.5)
         {
            _loc5_ = 2;
         }
         else
         {
            _loc5_ = 1;
         }
         if(_loc6_ > 0.5)
         {
            _loc6_ = 2;
         }
         else
         {
            _loc6_ = 1;
         }
         if(_loc2_ > 0.5)
         {
            _loc2_ = 2;
         }
         else
         {
            _loc2_ = 1;
         }
         if(_loc4_ == "Nameless" || _loc4_ == "Kusanagi" || _loc4_ == "Andy" || _loc4_ == "Ash" || _loc4_ == "Oswald")
         {
            _loc5_ = 1;
         }
         if(_loc3_ == "Nameless" || _loc3_ == "Kusanagi" || _loc3_ == "Andy" || _loc3_ == "Ash" || _loc3_ == "Oswald")
         {
            _loc6_ = 1;
         }
         if(_loc2_ == "Nameless" || _loc2_ == "Kusanagi" || _loc2_ == "Andy" || _loc2_ == "Ash" || _loc2_ == "Oswald")
         {
            _loc2_ = 1;
         }
         var _loc10_ = _loc4_ + _loc5_.toString();
         this.faceMC.head_loader.mc.gotoAndStop(_loc10_);
         this.name_mc.gotoAndStop(_loc4_);
         this.selectRanRole = _loc4_;
         this.selectMode = _loc5_;
         var _loc8_ = _loc3_ + _loc6_.toString();
         this.faceMC.head_loader.mc.gotoAndStop(_loc8_);
         this.name_mc.gotoAndStop(_loc3_);
         this.selectRanRole2 = _loc3_;
         this.selectMode2 = _loc6_;
         var _loc9_ = _loc7_ + _loc2_.toString();
         this.faceMC.head_loader.mc.gotoAndStop(_loc9_);
         this.name_mc.gotoAndStop(_loc7_);
         this.selectRanRole3 = _loc7_;
         this.selectMode3 = _loc2_;
      };
   }
   function showFace(_face)
   {
      var _loc2_ = _face;
      if(_loc2_ == "" || _loc2_ == undefined)
      {
         _loc2_ = "none";
      }
      if(_loc2_ == "Iori3_black")
      {
         _loc2_ = "Iori3_black";
      }
      if(_loc2_ == "Rugal_black")
      {
         _loc2_ = "Rugal_black";
      }
      if(_loc2_ == "Igniz_black")
      {
         _loc2_ = "Igniz_black";
      }
      if(_loc2_ == "Orochi_black")
      {
         _loc2_ = "Orochi_black";
      }
      this.faceMC.gotoAndPlay(1);
      if(_loc2_ == "random")
      {
         this.randomSelect();
      }
      if(_loc2_ == "randomNormal")
      {
         this.randomSelectNormal();
      }
      else
      {
         if(_level0.SE_old)
         {
            _level0.select97_snd.start();
         }
         else
         {
            _level0.select02um_snd.start();
         }
         this.faceMC.head_loader.mc.gotoAndStop(_loc2_);
      }
   }
   function showName(name, nextMode)
   {
      if(name == "" || name == undefined)
      {
         this.name_mc.gotoAndStop("none");
         this.fromTxt_mc.gotoAndStop("none");
         return undefined;
      }
      var _loc5_ = _level0.mc_list[name];
      if(_level0.player_type == "1PVSCOM" && _level0.stageID > 0)
      {
         this.showCpuMode2(_loc5_,nextMode,name);
      }
      if(name == "random")
      {
         this.randomSelect();
      }
      if(name == "randomNormal")
      {
         this.randomSelectNormal();
      }
      if(name == "Iori" && nextMode == 3)
      {
         this.name_mc.gotoAndStop("Iori3");
      }
      else if(name == "Orochi" && nextMode == 2)
      {
         this.name_mc.gotoAndStop("Orochi2");
      }
      else if(name == "Zero" && nextMode == 2)
      {
         this.name_mc.gotoAndStop("Zero2");
      }
      else
      {
         this.name_mc.gotoAndStop(name);
      }
      var _loc3_;
      if(name == "Ryu")
      {
         _loc3_ = "sf";
      }
      else if(name == "Chunli")
      {
         _loc3_ = "sf";
      }
      else if(name == "Moriya")
      {
         _loc3_ = "lb";
      }
      else if(name == "Haohmaru")
      {
         _loc3_ = "sh";
      }
      else
      {
         _loc3_ = "kof";
      }
      this.fromTxt_mc.gotoAndStop(_loc3_);
   }
   function selectOK(isRandom)
   {
      if(!this.select_now.active && _level0.P2_type != "cpu")
      {
         return undefined;
      }
      if(!this.select_now.loadOK)
      {
         return undefined;
      }
      if(this.playerType == "p1")
      {
         _level0.selectCount1P++;
         if(_level0.selectCount1P > _level0.selectMax)
         {
            return undefined;
         }
      }
      else if(this.playerType == "p2")
      {
         _level0.selectCount2P++;
         if(_level0.selectCount2P > _level0.selectMax)
         {
            return undefined;
         }
      }
      var _loc3_;
      var _loc4_;
      var _loc2_;
      if(_level0.moreVs == true)
      {
         if(this.selectP1 == true && _level0.moreVs3V3 != true || this.selectP2 == true && _level0.moreVs3V3 == true)
         {
            if(_level0.moreVs3V3 != true)
            {
               this.selectRole2 = this.select_now.$role;
               if(this.selectRole2 == "random" || this.selectRole2 == "randomNormal")
               {
                  if(this.selectRole2 == "random")
                  {
                     _level0.ranCharSelectNum2 = true;
                  }
                  else
                  {
                     _level0.ranCharSelectNNum2 = true;
                  }
                  _level0.ranCharSelect_name = this._name;
                  this.selectRole2 = this.selectRanRole;
                  this.showFace(this.selectRole2 + this.selectMode);
                  this.showName(this.selectRole2,this.selectMode);
               }
               this.Mode2 = this.selectMode;
               if(isRandom == true)
               {
                  _loc3_ = Math.round(Math.random() * (_level0.cpuNormal_list.length - 1) + 1);
                  _loc4_ = Math.random();
                  this.selectRole2 = _loc3_;
                  this.Mode2 = _loc4_ <= 0.5 ? 2 : 1;
               }
               this.showSound(this.selectRole2,this.Mode2);
            }
            else if(_level0.moreVs3V3 == true)
            {
               this.selectRole3 = this.select_now.$role;
               if(this.selectRole3 == "random" || this.selectRole3 == "randomNormal")
               {
                  if(this.selectRole3 == "random")
                  {
                     _level0.ranCharSelectNum3 = true;
                  }
                  else
                  {
                     _level0.ranCharSelectNNum3 = true;
                  }
                  _level0.ranCharSelect_name = this._name;
                  this.selectRole3 = this.selectRanRole;
                  this.showFace(this.selectRole3 + this.selectMode);
                  this.showName(this.selectRole3,this.selectMode);
               }
               this.Mode3 = this.selectMode;
               if(isRandom == true)
               {
                  _loc2_ = Math.round(Math.random() * (_level0.cpuNormal_list.length - 1) + 1);
                  _loc4_ = Math.random();
                  this.selectRole3 = _loc2_;
                  this.Mode3 = _loc4_ <= 0.5 ? 2 : 1;
               }
               this.showSound(this.selectRole3,this.Mode3);
            }
            if(this.selectP1 == true && _level0.moreVs3V3 != true || this.selectP2 == true && _level0.moreVs3V3 == true)
            {
               delete this.onEnterFrame;
               if(_level0.SE_old)
               {
                  _level0.ok97_snd.start();
               }
               else
               {
                  _level0.ok02um_snd.start();
               }
               this.play();
               this.selectOK_char();
               this.onKeyDown = null;
            }
         }
         else
         {
            if(_level0.moreVs3V3 == true && this.selectP1 == true)
            {
               this.selectRole2 = this.select_now.$role;
            }
            else
            {
               this.selectRole = this.select_now.$role;
            }
            if(this.selectRole == "random" || this.selectRole == "randomNormal")
            {
               if(this.selectRole == "random")
               {
                  _level0.ranCharSelect = true;
               }
               else
               {
                  _level0.ranCharSelectN = true;
               }
               _level0.ranCharSelect_name = this._name;
               this.selectRole = this.selectRanRole;
            }
            if(this.selectRole2 == "random" || this.selectRole2 == "randomNormal")
            {
               if(this.selectRole2 == "random")
               {
                  _level0.ranCharSelectNum2 = true;
               }
               else
               {
                  _level0.ranCharSelectNNum2 = true;
               }
               _level0.ranCharSelect_name = this._name;
               this.selectRole2 = this.selectRanRole;
            }
            this.select_now.select._visible = true;
            if(_level0.moreVs3V3 == true && this.selectP1 == true)
            {
               this.Mode2 = this.selectMode;
            }
            else
            {
               this.Mode1 = this.selectMode;
            }
            this.select_now.$type = this.select_now.types;
            if(!(this.select_now.name == "Iori" && this.select_now.types == 3))
            {
               this.select_now.gotoAndStop(this.select_now.name);
            }
            if(_level0.moreVs3V3 == true && this.selectP1 == true)
            {
               this.selectP2 = true;
            }
            else
            {
               this.selectP1 = true;
            }
            if(_level0.moreVs3V3 != true)
            {
               this.showSound(this.selectRole,this.Mode1);
            }
            else if(this.selectP2 != true)
            {
               this.showSound(this.selectRole,this.Mode1);
            }
            else
            {
               this.showSound(this.selectRole2,this.Mode2);
            }
            if(_level0.SE_old)
            {
               _level0.ok97_snd.start();
            }
            else
            {
               _level0.ok02um_snd.start();
            }
         }
      }
      else
      {
         this.selectRole = this.select_now.$role;
         if(this.selectRole == "random" || this.selectRole == "randomNormal")
         {
            if(this.selectRole == "random")
            {
               _level0.ranCharSelect = true;
            }
            else
            {
               _level0.ranCharSelectN = true;
            }
            _level0.ranCharSelect_name = this._name;
            this.selectRole = this.selectRanRole;
            this.showFace(this.selectRole + this.selectMode);
            this.showName(this.selectRole,this.selectMode);
         }
         this.Mode1 = this.selectMode;
         this.showSound(this.selectRole,this.Mode1);
         delete this.onEnterFrame;
         if(_level0.SE_old)
         {
            _level0.ok97_snd.start();
         }
         else
         {
            _level0.ok02um_snd.start();
         }
         this.play();
         this.selectOK_char();
         this.onKeyDown = null;
      }
   }
   function selectOK_random()
   {
      if(!this.select_now.loadOK)
      {
         return undefined;
      }
      delete this.onEnterFrame;
      if(_level0.ranCharSelect || _level0.ranCharSelectN)
      {
         _level0.charSelect_P1 = this.selectRanRole;
         _level0.mode_role_P1 = this.selectMode;
         _level0.charSelect_P1_origin = this.selectRanRole;
         _level0.mode_role_P1_origin = this.selectMode;
         this.showFace(this.selectRanRole + this.selectMode);
         this.showName(this.selectRanRole,this.selectMode);
         this.showSound(this.selectRanRole,this.selectMode);
         if(_level0.SE_old)
         {
            _level0.ok97_snd.start();
         }
         else
         {
            _level0.ok02um_snd.start();
         }
         _level0.selectCount1P++;
      }
      if(_level0.ranCharSelectNum2 || _level0.ranCharSelectNNum2)
      {
         _level0.charSelect_P12 = this.selectRanRole2;
         _level0.mode_role_P12 = this.selectMode2;
         _level0.charSelect_P12_origin = this.selectRanRole2;
         _level0.mode_role_P12_origin = this.selectMode2;
         this.showFace(this.selectRanRole2 + this.selectMode2);
         this.showName(this.selectRanRole2,this.selectMode2);
         this.showSound(this.selectRanRole2,this.selectMode2);
         if(_level0.SE_old)
         {
            _level0.ok97_snd.start();
         }
         else
         {
            _level0.ok02um_snd.start();
         }
         _level0.selectCount1P++;
      }
      if(_level0.ranCharSelectNum3 || _level0.ranCharSelectNNum3)
      {
         _level0.charSelect_P13 = this.selectRanRole3;
         _level0.mode_role_P13 = this.selectMode3;
         _level0.charSelect_P13_origin = this.selectRanRole3;
         _level0.mode_role_P13_origin = this.selectMode3;
         this.showFace(this.selectRanRole3 + this.selectMode3);
         this.showName(this.selectRanRole3,this.selectMode3);
         this.showSound(this.selectRanRole3,this.selectMode3);
         if(_level0.SE_old)
         {
            _level0.ok97_snd.start();
         }
         else
         {
            _level0.ok02um_snd.start();
         }
         _level0.selectCount1P++;
      }
      if(_level0.charSelect_P1 == undefined)
      {
         _level0.charSelect_P1 = "Kyo";
         _level0.charSelect_P1_origin = "Kyo";
      }
      if(_level0.charSelect_P12 == undefined)
      {
         _level0.charSelect_P12 = "Iori";
         _level0.charSelect_P12_origin = "Iori";
      }
      if(_level0.charSelect_P13 == undefined)
      {
         _level0.charSelect_P13 = "Ash";
         _level0.charSelect_P13_origin = "Ash";
      }
      if(_level0.mode_role_P1 == undefined)
      {
         _level0.mode_role_P1 = 1;
         _level0.mode_role_P1_origin = 1;
      }
      if(_level0.mode_role_P12 == undefined)
      {
         _level0.mode_role_P12 = 1;
         _level0.mode_role_P12_origin = 1;
      }
      if(_level0.mode_role_P13 == undefined)
      {
         _level0.mode_role_P13 = 1;
         _level0.mode_role_P13_origin = 1;
      }
   }
   function showSound(role, mode)
   {
      this._parent.roleSound.gotoAndStop(1);
      this._parent.roleSound.gotoAndStop(role + mode);
   }
   function showCpuMode2(next, nextMode, nextChar)
   {
      if(nextMode == 2)
      {
         if(nextChar == "Orochi" || nextChar == "Athena" || nextChar == "Ash" || nextChar == "KyoW")
         {
            next.gotoAndStop(nextChar + "2");
         }
         if(nextChar == "Zero")
         {
            next.gotoAndStop("jzero");
         }
      }
   }
}
