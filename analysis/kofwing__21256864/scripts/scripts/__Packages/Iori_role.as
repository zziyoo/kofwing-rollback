class Iori_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var Vx;
   var Vy;
   var _roleName;
   var _x;
   var _y;
   var b;
   var burstList;
   var burst_mode;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var getObjs;
   var gotoAndStop;
   var inBurst;
   var input_pre;
   var jumpSkill;
   var land_Y;
   var mode_key;
   var normalList2;
   var opp;
   var opp_hight2;
   var opp_width2;
   var pitch;
   var powerDec;
   var powerDecType;
   var record_skill_totalFrame;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var stop_move_Y1;
   var superList;
   var superMaxList;
   var toSkill;
   var toStatus;
   var winPoseArray;
   function Iori_role()
   {
      super();
      this._roleName = "Iori";
      this.scale = 100;
      this.Vwalk = 10;
      this.Vdash = 29;
      this.Vjump_x = 13;
      this.Vjump_y = 39;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {sk_s1:1,sk_s_89b:1,sk_s_caihua0:1,sk_huofeng:1};
      this.burstList = {sk_s_qianzai2:1,sk_s_3shenji2:1,sk_max3b:1};
      this.superMaxList = {sk_s1_s:1,sk_s_89b_s:1};
      this.skillSuperMapping = {sk_s1:"sk_s1_s",sk_s_89b:"sk_s_89b_s"};
      this.winPoseArray = ["end","end2","end4"];
      this.skillObj.s1 = "sk_s1";
      this.skillObj.s2 = "sk_s_89b";
      this.skillObj.s3 = "sk_s_caihua0";
      this.skillObj.busrt_a = "sk_s_qianzai2";
      this.skillObj.busrt_d = "sk_s_3shenji2";
      this.skillObj.toAir = "sk0";
      this.record_skill_totalFrame = ["sk_s1","sk_s4","sk_s3"];
      this.normalList2 = ["sk_hang","sk_hang2","sk_hang3","punch_s1","punch_s2","kick_s1","airBack","jumpSilll_kick_s"];
      this.comboClass = new Iori_Combo(this);
      this.preCheck();
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-100",rb:"255",ga:"-100",gb:"100",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
      this.colorObj.huoFeng2 = {ra:"100",rb:"255",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.huoFeng1 = {ra:"100",rb:"55",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.sk4 = 35;
      this.input_pre.getup1 = 20;
      this.input_pre.getup2 = 20;
      this.input_pre.sk_CYue = 26;
      this.input_pre.sk_CYue_l = 19;
      this.input_pre.sk5_1 = 18;
      this.input_pre.sk5_2 = 18;
   }
   function sk4()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.opp.mc.catched)
      {
         this.toStatus("stand");
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk4";
      this.gotoAndStop(this.status_1);
   }
   function sk_CChun()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_CChun";
      this.gotoAndStop(this.status_1);
   }
   function sk_s2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_s2";
      this.gotoAndStop(this.status_1);
   }
   function sk_s2_s()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_s2_s";
      this.gotoAndStop(this.status_1);
   }
   function sk_max3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(!this.inBurst)
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_max3";
      this.gotoAndStop("sk_max3");
      return true;
   }
   function sk_s_3shenji2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(!this.inBurst)
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.status_1 = "sk_s_3shenji2";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_qianzai2o()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(!this.inBurst)
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.status_1 = "sk_s_qianzai2o";
      this.gotoAndStop(this.status_1);
   }
   function sk_max3b()
   {
      if(this._y != this.land_Y)
      {
         return false;
      }
      if(!this.inBurst)
      {
         return false;
      }
      this.opp_hight2 = 120;
      this.stop_move_Y1("none");
      this.status_2 = "land";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_max3b";
      this.gotoAndStop("sk_max3b");
      return true;
   }
   function sk_max3c()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(!this.inBurst)
      {
         return false;
      }
      this.opp_hight2 = 120;
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_max3c";
      this.gotoAndStop("sk_max3c");
      return true;
   }
   function sk_s_89b()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if((this.opp.status_7 == "aaa" || this.opp.status_7 == "bbb") && this.opp.status_3 == "hurt")
      {
         return false;
      }
      this.status_1 = "sk_s_89b";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      return true;
   }
   function sk_s_89b_s()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.opp.mc.in89b)
      {
         return false;
      }
      this.status_1 = "sk_s_89b_s";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      return true;
   }
   function sk1_3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.status_1 != "sk1_2")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk1_3";
      this.gotoAndStop(this.status_1);
      return true;
   }
   function sk1_3_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.status_1 != "sk1_2_l")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk1_3_l";
      this.gotoAndStop(this.status_1);
      return true;
   }
   function sk_s3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_s3";
      this.gotoAndStop(this.status_1);
   }
   function sk2_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "Iori_fire3_light" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "sk2_l";
      this.gotoAndStop(this.status_1);
   }
   function sk2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "Iori_fire3" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "sk2";
      this.gotoAndStop(this.status_1);
   }
   function sk3()
   {
      if(this.status_2 != "land" || this.status_1 == "sk3")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk3";
      this.gotoAndStop(this.status_1);
   }
   function sk_s4()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_s4";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_caihua0()
   {
      return false;
   }
   function sk_s_caihua_ai()
   {
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.status_3 = "attack";
      this.status_1 = "sk_s_caihua";
      this.gotoAndStop("sk_s_caihua");
      return true;
   }
   function sk_s_caihua_s_ai()
   {
      if(!(this.inBurst && this.burst_mode == "power"))
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.status_3 = "attack";
      this.status_1 = "sk_s_caihua_s";
      this.gotoAndStop("sk_s_caihua_s");
      return true;
   }
   function sk_bachiwu_maxCancel()
   {
      return false;
   }
   function nomove()
   {
      return false;
   }
   function sk_huofeng()
   {
      if(this.inBurst)
      {
         return false;
      }
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num < 2 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num < 2)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.powerDecType = "super";
      this.powerDec();
      this.status_3 = "attack";
      this.status_1 = "sk_huofeng";
      this.gotoAndStop("sk_huofeng");
      return true;
   }
   function airBack()
   {
      this.Vx = -35;
      this.Vy = 22;
      this.status_1 = "airBack";
      this.status_3 = "attack";
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
      if(this.status_1 == "dash_b")
      {
         _loc2_ = "airBack";
         this.toSkill(_loc2_);
         return undefined;
      }
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         if(this.dir == 1)
         {
            if(Key.isDown(this.f) && this._x > this.opp._x)
            {
               _loc2_ = "kick_s";
            }
            else if(Key.isDown(this.b) && this._x < this.opp._x)
            {
               _loc2_ = "kick_s";
            }
            else
            {
               _loc2_ = "kick_l";
            }
         }
         else if(this.dir == -1)
         {
            if(Key.isDown(this.b) && this._x < this.opp._x)
            {
               _loc2_ = "kick_s";
            }
            else if(Key.isDown(this.f) && this._x > this.opp._x)
            {
               _loc2_ = "kick_s";
            }
            else
            {
               _loc2_ = "kick_l";
            }
         }
         this.jumpSkill(_loc2_);
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatKick_l";
      }
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "kick_s3";
         }
         else
         {
            _loc2_ = "kick_s1";
         }
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "kick_s3";
         }
         else
         {
            _loc2_ = "kick_s1";
         }
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
      if(Key.isDown(this.d))
      {
         if(Key.isDown(this.f) && this.dir == 1)
         {
            if(this.status_3 == "attack")
            {
               _loc2_ = "sk_hang2";
            }
            else
            {
               _loc2_ = "sk_hang";
            }
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            if(this.status_3 == "attack")
            {
               _loc2_ = "sk_hang2";
            }
            else
            {
               _loc2_ = "sk_hang";
            }
         }
         else
         {
            _loc2_ = "squatPunch";
         }
      }
      else if(this.status_1 == "dash_f")
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
      if(this.status_1 == "punch_s1")
      {
         if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
         {
            _loc2_ = "punch_s2";
         }
      }
      else if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch_l";
         if(this.status_1 == "sk_s1" || this.status_1 == "sk_s1_s")
         {
            _loc2_ = this.skillObj.s3;
         }
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         _loc2_ = "punch_s1";
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
}
