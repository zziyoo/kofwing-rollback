class Ryo_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var b;
   var burstList;
   var burst_mode;
   var checkSide_abs;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var inBurst;
   var input_pre;
   var jumpSkill;
   var mode_key;
   var normalList2;
   var opp_hight2;
   var opp_width2;
   var pitch;
   var powerDec;
   var powerDecType;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var skill_mc;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var superList;
   var superMaxList;
   var toSkill;
   function Ryo_role()
   {
      super();
      this._roleName = "Ryo";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 39;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {sk10:1,sk10_l:1,sk_dfdf_p:1,sk_dfdb_k:1};
      this.burstList = {sk_s_sys:1,sk_dfdb_k_max:1};
      this.superMaxList = {sk12:1,sk12_l:1,sk_dfdf_p_s:1};
      this.skillSuperMapping = {sk10:"sk12",sk10_l:"sk12_l",sk_dfdf_p:"sk_dfdf_p_s"};
      this.skillObj.s1 = "sk10";
      this.skillObj.s2 = "sk_dfdf_p";
      this.skillObj.busrt_a = "sk_s_sys";
      this.skillObj.busrt_d = "sk_dfdb_k_max";
      this.skillObj.toAir = "sk3";
      this.skillObj.heavyHit = "heavyHit";
      this.skillObj.flyingObj = "sk1";
      this.normalList2 = ["punch_s","punch_s2"];
      this.comboClass = new Ryo_Combo(this);
      this.preCheck();
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-45",rb:"255",ga:"-100",gb:"200",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.getup1 = 20;
      this.input_pre.getup2 = 20;
      this.input_pre.kick1 = 9;
      this.input_pre.sk_SKF_l = 22;
      this.input_pre.sk1_ex = 19;
      this.input_pre.sk1_l_ex = 17;
   }
   function sk_s3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = 120;
      this.gotoAndStop("sk_s3");
      this.status_1 = "sk_s3";
      this.status_3 = "attack";
   }
   function sk_s3_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = 120;
      this.gotoAndStop("sk_s3_l");
      this.status_1 = "sk_s3_l";
      this.status_3 = "attack";
   }
   function sk_s3_s()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = 120;
      this.gotoAndStop("sk_s3_s");
      this.status_1 = "sk_s3_s";
      this.status_3 = "attack";
   }
   function kick2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.gotoAndStop("kick2");
      this.status_1 = "kick2";
      this.status_3 = "attack";
   }
   function kick1()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.status_1 = "kick1";
      this.gotoAndStop(this.status_1);
   }
   function kick3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.status_1 = "kick3";
      this.gotoAndStop(this.status_1);
   }
   function kick12()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.status_1 = "kick12";
      this.gotoAndStop(this.status_1);
   }
   function kick32()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.status_1 = "kick32";
      this.gotoAndStop(this.status_1);
   }
   function kick13()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.status_1 = "kick13";
      this.gotoAndStop(this.status_1);
   }
   function kick33()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.status_1 = "kick33";
      this.gotoAndStop(this.status_1);
   }
   function sk_dfdb_k_max()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.status_1 = "sk_dfdb_k_max";
      this.gotoAndStop(this.status_1);
   }
   function punch2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "punch2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function heavyHit()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "heavyHit";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk1()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk_bodong_air2";
      }
      else
      {
         if(this.skill_mc && this.skill_mc.objName == "ryo_wave_s2" && this.skill_mc.allowNum == 1)
         {
            return false;
         }
         this.status_1 = "sk1";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk1_l()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk_bodong_air2other";
      }
      else
      {
         if(this.skill_mc && this.skill_mc.objName == "ryo_wave_l" && this.skill_mc.allowNum == 1)
         {
            return false;
         }
         this.status_1 = "sk1_l";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk12()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk12";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk13()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk13";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk10_ai()
   {
      var _loc2_ = Math.random();
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         this.status_1 = "sk1_ex";
      }
      else
      {
         if(_loc2_ <= 1 - 0.14 * _level0.level && !this.inBurst)
         {
            if(this.inBurst && this.burst_mode == "power")
            {
               this.status_1 = "sk12";
            }
            else
            {
               this.status_1 = "sk10";
            }
            this.powerDecType = "super";
            this.powerDec();
            this.gotoAndStop(this.status_1);
            return true;
         }
         this.status_1 = "sk1_ex";
      }
      this.gotoAndStop(this.status_1);
   }
   function sk10_l_ai()
   {
      var _loc2_ = Math.random();
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         this.status_1 = "sk1_l_ex";
      }
      else
      {
         if(_loc2_ <= 1 - 0.14 * _level0.level && !this.inBurst)
         {
            if(this.inBurst && this.burst_mode == "power")
            {
               this.status_1 = "sk12_l";
            }
            else
            {
               this.status_1 = "sk10_l";
            }
            this.powerDecType = "super";
            this.powerDec();
            this.gotoAndStop(this.status_1);
            return true;
         }
         this.status_1 = "sk1_l_ex";
      }
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
      if(this.status_1 == "dash_f")
      {
         _loc2_ = "kick1";
      }
      else if(Key.isDown(this.d))
      {
         if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
         {
            _loc2_ = "kick3";
         }
         else
         {
            _loc2_ = "squatKick_l";
         }
      }
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         _loc2_ = "kick1";
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         _loc2_ = "kick1";
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
         if(Key.isDown(this.d))
         {
            this.jumpSkill("punch_s");
         }
         else
         {
            this.jumpSkill("punch");
         }
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch";
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
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch_l";
      }
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "punch_s2";
         }
         else
         {
            _loc2_ = "punch_s";
         }
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "punch_s2";
         }
         else
         {
            _loc2_ = "punch_s";
         }
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
