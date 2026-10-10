class Rugal_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var _x;
   var _y;
   var b;
   var burstList;
   var checkSide_abs;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var egde_max;
   var egde_min;
   var f;
   var getObjs;
   var gotoAndPlay;
   var gotoAndStop;
   var ida;
   var input_pre;
   var jumpSkill;
   var mc;
   var mode_key;
   var normalList2;
   var nosh;
   var onEnterFrame;
   var onHit;
   var opp;
   var opp_width2;
   var pitch;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var superList;
   var superMaxList;
   var toSkill;
   var toStatus;
   var topLayer;
   var winPoseArray;
   function Rugal_role()
   {
      super();
      this._roleName = "Rugal";
      this.scale = 100;
      this.Vwalk = 10;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 42;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {dfdf_p_EX:1,dfdf_k_EX:1,dfdf_kl_EX:1,dfdf_k:1};
      this.burstList = {df_o:1,db_o:1};
      this.superMaxList = {dfdf_p_max_EX:1,dfdf_k_max_EX:1,dfdf_k_max:1};
      this.skillSuperMapping = {dfdf_p_EX:"dfdf_p_max_EX",dfdf_k_EX:"dfdf_k_max_EX",dfdf_kl_EX:"dfdf_k_max_EX",dfdf_k:"dfdf_k_max"};
      this.normalList2 = ["f_kl"];
      this.winPoseArray = ["end"];
      var _loc15_ = Math.random();
      this.gotoAndStop("begin");
      this.skillObj.s1 = "dfdf_p_EX";
      this.skillObj.s2 = "dfdf_k_EX";
      this.skillObj.busrt_a = "df_o";
      this.skillObj.busrt_d = "db_o";
      this.skillObj.toAir = "fdf_k2";
      this.skillObj.flyingObj = "fbdf_p";
      this.comboClass = new Rugal_Combo(this);
      this.preCheck();
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-45",rb:"255",ga:"-100",gb:"200",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.fdf_k3 = 5;
   }
   function dfdf_k_EX()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.mc.hitPos = "all";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "dfdf_k_EX";
      this.gotoAndStop(this.status_1);
   }
   function dfdf_kl_EX()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.mc.hitPos = "all";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "dfdf_kl_EX";
      this.gotoAndStop(this.status_1);
   }
   function dfdf_k_max_EX()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.mc.hitPos = "all";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "dfdf_k_max_EX";
      this.gotoAndStop(this.status_1);
   }
   function db_p()
   {
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.df_p_air();
         return undefined;
      }
      this.status_3 = "attack";
      this.status_1 = "db_p";
      this.gotoAndStop(this.status_1);
   }
   function db_ph()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "Rugal_shanzi2" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "db_ph";
      this.gotoAndStop(this.status_1);
   }
   function to_kick()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("kick");
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatKick";
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.pitch(true))
         {
            return undefined;
         }
         _loc2_ = "kick";
      }
      else
      {
         _loc2_ = "kick";
      }
      this.toSkill(_loc2_);
   }
   function to_kick_l()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         _loc2_ = "kick_l";
         this.jumpSkill(_loc2_);
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatKick_l";
      }
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         _loc2_ = "f_kl";
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         _loc2_ = "f_kl";
      }
      else if(this.mode_key == "easy")
      {
         _loc2_ = this.skillObj.s2;
      }
      else
      {
         _loc2_ = "kick_l";
      }
      this.toSkill(_loc2_);
   }
   function to_punch()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("punch");
         return undefined;
      }
      if(this.status_1 == "dash_f")
      {
         _loc2_ = "punch";
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.pitch())
         {
            return undefined;
         }
         _loc2_ = "punch";
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch";
      }
      else
      {
         _loc2_ = "punch";
      }
      this.toSkill(_loc2_);
   }
   function to_punch_l()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("punch_l");
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch_l";
      }
      else if(this.mode_key == "easy")
      {
         _loc2_ = this.skillObj.s1;
      }
      else
      {
         _loc2_ = "punch_l";
      }
      this.toSkill(_loc2_);
   }
   function catch_oppPos21(obj, obj2, status_c, flag, condition_land, condition_hurt, downHit, oppDirChange, rollHit, condition_air, hitID)
   {
      if(this.opp.nosh == true)
      {
         return undefined;
      }
      if(condition_land)
      {
         if(this.opp.status_2 == "air" || this.opp.status_1 == "hurt6")
         {
            return undefined;
         }
      }
      if(condition_hurt)
      {
         if(!(this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
         {
            if(!(this.opp.status_3 == "down" && this.onHit))
            {
               return undefined;
            }
         }
      }
      if(!downHit)
      {
         if(this.opp.status_3 == "down")
         {
            return undefined;
         }
      }
      var _loc5_;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      if(obj.hitTest(this.opp.mc.body) || rollHit && obj.hitTest(this.opp) && this.opp.status_3 == "roll" || obj.hitTest(this.opp.mc) && this.opp.status_1 == "hurt6")
      {
         this.opp.nosh = false;
         this.onHit = true;
         this.opp.status_3 = "hurt";
         this.opp.toStatus(status_c);
         this.opp.mc.gotoAndStop(flag);
         this.opp.skillCount = false;
         this.opp.inCount = false;
         this.opp.status_7 = hitID;
         this.opp.status_2 = "land";
         delete this.opp.onEnterFrame;
         _loc5_ = Func.lToG(obj2);
         _loc2_ = _loc5_.x;
         _loc4_ = _loc5_.y;
         if(_level0._xscale != 100)
         {
            if(_loc2_ > this.egde_max * _level0._xscale)
            {
               _loc2_ = this.egde_max * _level0._xscale;
            }
            else if(_loc2_ < this.egde_min)
            {
               _loc2_ = this.egde_min;
            }
            _loc3_ = new Object();
            _loc3_.x = _loc2_;
            _loc3_.y = _loc4_;
            _level0.char_mc.globalToLocal(_loc3_);
            this.opp._x = _loc3_.x;
            this.opp._y = _loc3_.y;
         }
         else
         {
            if(_loc2_ > this.egde_max)
            {
               _loc2_ = this.egde_max;
            }
            else if(_loc2_ < this.egde_min)
            {
               _loc2_ = this.egde_min;
            }
            _loc3_ = new Object();
            _loc3_.x = _loc2_;
            _loc3_.y = _loc4_;
            _level0.char_mc.globalToLocal(_loc3_);
            this.opp._x = _loc3_.x;
            this.opp._y = _loc3_.y;
         }
         if(this.dir == this.opp.dir)
         {
            if(this.dir == 1)
            {
               this.opp.chageSide2();
            }
            else
            {
               this.opp.chageSide1();
            }
         }
         return true;
      }
      this.onHit = false;
   }
   function catch_HitTestR(obj, status_c, flag, condition_land, condition_hurt, downHit, superMoveEffect, visibility, changeDir, id, hitID)
   {
      if(condition_land)
      {
         if(this.opp.status_2 == "air")
         {
            return undefined;
         }
      }
      if(condition_hurt)
      {
         if(!(this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
         {
            if(!(this.opp.status_3 == "down" && this.onHit))
            {
               return undefined;
            }
         }
      }
      if(downHit == false)
      {
         if(this.opp.status_3 == "down")
         {
            return undefined;
         }
      }
      var _loc2_;
      var _loc3_;
      if(obj.hitTest(this.opp) && this.opp.status_3 == "roll" || obj.hitTest(this.opp.mc.body))
      {
         delete this.opp.onEnterFrame;
         this.opp.toStatus(status_c);
         this.opp.gotoAndStop(status_c);
         this.opp.mc.gotoAndStop(flag);
         this.opp.status_2 = "land";
         this.opp.status_3 = "hurt";
         this.onHit = true;
         this.opp.countEnd();
         this.ida = id;
         this.nosh = true;
         this.opp.status_7 = this.ida;
         hitID = this.ida;
         hitID = id;
         _loc2_ = this._x + obj._x * this.dir;
         _loc3_ = this._y + obj._y;
         if(_level0.char_mc._x + _loc2_ > this.egde_max)
         {
            _loc2_ = this.egde_max - _level0.char_mc._x;
         }
         else if(_level0.char_mc._x + _loc2_ < this.egde_min)
         {
            _loc2_ = this.egde_min - _level0.char_mc._x;
         }
         this.opp._x = _loc2_;
         if(changeDir && this.dir == this.opp.dir)
         {
            if(this.dir == 1)
            {
               this.opp.chageSide2();
            }
            else
            {
               this.opp.chageSide1();
            }
         }
         if(visibility == undefined)
         {
            visibility = true;
         }
         if(visibility)
         {
            if(superMoveEffect)
            {
               _level0.effect_mc.hitFire("hitFire3_super",_loc2_,_loc3_);
            }
            else
            {
               _level0.effect_mc.hitFire("hitFire3",_loc2_,_loc3_);
            }
         }
         this.topLayer();
         this.onEnterFrame = function()
         {
            this.opp.mc.stop();
            if(this.opp.status_1 != status_c)
            {
               this.opp.mc.play();
               delete this.onEnterFrame;
            }
         };
      }
      else
      {
         this.onHit = false;
         if(this.status_1 == "sk4")
         {
            this.gotoAndPlay("nohit");
         }
         else
         {
            this.toStatus("stand");
         }
      }
   }
   function df_pl()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "Rugal_shanzi1" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "df_pl";
      this.gotoAndStop(this.status_1);
   }
   function df_ph()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "Rugal_shanzi2" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "df_ph";
      this.gotoAndStop(this.status_1);
   }
   function df_p_air()
   {
      this.status_1 = "df_p_air";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
}
