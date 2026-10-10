class Kim_role extends role_corn.Role
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
   var frameOffset;
   var gotoAndStop;
   var inBurst;
   var input_pre;
   var jumpSkill;
   var kick_l;
   var mc;
   var mode_key;
   var normalList2;
   var opp_width2;
   var pitch;
   var punch_l;
   var record_skill_totalFrame;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var superList;
   var superMaxList;
   var switchSkill;
   var toSkill;
   var toStatus_switch;
   var winPoseArray;
   function Kim_role()
   {
      super();
      this._roleName = "Kim";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 29;
      this.Vjump_x = 13;
      this.Vjump_y = 43;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.frameOffset = 2;
      this.superList = {sk29:1,sk31:1,sk31_air:1};
      this.burstList = {sk_s3:1,sk3:1,sk_secret_ShenChen:1};
      this.superMaxList = {sk29_s:1,sk31_s:1,sk31_s_air:1};
      this.skillSuperMapping = {sk29:"sk29_s",sk31:"sk31_s",sk31_air:"sk31_s_air"};
      this.normalList2 = ["kick3","kick4","dash_pl","dash_pl2"];
      this.skillObj.s1 = "sk29";
      this.skillObj.s2 = "sk31";
      this.skillObj.busrt_a = "sk3";
      this.skillObj.busrt_d = "sk_s3";
      this.skillObj.toAir = "sk0_h";
      this.skillObj.toAir = "sk47_h";
      this.winPoseArray = ["end","end2"];
      this.record_skill_totalFrame = ["sk1_2","sk28"];
      this.comboClass = new Kim_Combo(this);
      this.preCheck();
      this.colorObj.fire_red1 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red2 = {ra:"-45",rb:"255",ga:"-100",gb:"200",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
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
      this.input_pre.sk2 = 18;
      this.input_pre.sk2_h = 22;
   }
   function kick3()
   {
      if(this.status_2 == "air" && this.mode_key == "easy")
      {
         if(this.status_1 == "sk31" || this.status_1 == "sk31_air" || this.status_1 == "sk31_s" || this.status_1 == "sk31_s_air")
         {
            return false;
         }
         this.toSkill("sk31");
         if(this.inBurst == true && this.burst_mode == "power")
         {
            this.sk31_s();
         }
         else if(this.inBurst == true || this == _level0.P1_role && _level0.LP_P1.powerPoint_num > 0 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num > 0)
         {
            this.sk31();
         }
      }
      else if(this.status_2 == "air")
      {
         this.kick_l();
      }
      else
      {
         if(this.status_2 != "land")
         {
            return undefined;
         }
         if(this.status_3 == "attack")
         {
            this.status_1 = "kick4";
         }
         else
         {
            this.status_1 = "kick3";
         }
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk19_l()
   {
      if(this.status_2 == "air" && this.mode_key == "easy")
      {
         this.toSkill("sk29");
         if(this.inBurst == true && this.burst_mode == "power")
         {
            this.sk29_s();
         }
         else if(this.inBurst == true || this == _level0.P1_role && _level0.LP_P1.powerPoint_num > 0 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num > 0)
         {
            this.sk29();
         }
      }
      else if(this.status_2 == "air")
      {
         this.punch_l();
      }
      else
      {
         if(this.status_2 != "land")
         {
            return undefined;
         }
         this.status_1 = "sk19";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk1_2()
   {
      this.status_1 = "sk1_2";
      this.mc.gotoAndPlay("s_2");
   }
   function dash_pl2()
   {
      if(this.status_2 == "land")
      {
         return false;
      }
      this.status_1 = "dash_pl2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk32()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk32";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk2()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk2_air";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else
      {
         this.status_1 = "sk2";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk2_h()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk2_h_air";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else
      {
         this.status_1 = "sk2_h";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk34()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk34";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk0_h_s2()
   {
      if(this.mc.played)
      {
         return false;
      }
      this.mc.played = true;
      this.status_3 = "attack";
      this.mc.gotoAndPlay("s2");
   }
   function sk14_h()
   {
      if(this.status_2 != "air" || this.status_1 == "dash_pl")
      {
         this.to_kick();
         return false;
      }
      this.status_1 = "sk14_h";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk14()
   {
      if(this.status_2 != "air" || this.status_1 == "dash_pl")
      {
         this.to_kick_l();
         return false;
      }
      this.status_1 = "sk14";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk47_kick()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.status_1 = "sk47_kick";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_kick()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.status_1 = "sk_kick";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk19_ai()
   {
      if(this.status_2 == "air")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk19");
      this.status_1 = "sk19_ai";
   }
   function sk43_l_ai()
   {
      if(this.status_2 == "air")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk43_l");
      this.status_1 = "sk43_l_ai";
   }
   function sk29()
   {
      if(this.status_2 == "land")
      {
         return false;
      }
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk29";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk29_s()
   {
      if(this.status_2 == "land")
      {
         return false;
      }
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk29_s";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk1()
   {
      if(this.status_2 == "air")
      {
         return false;
      }
      this.status_1 = "sk1";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk46()
   {
      if(this.status_2 == "air")
      {
         this.status_1 = "sk46";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk48()
   {
      if(this.status_1 == "sk48" || this.status_2 != "air")
      {
         this.to_kick_l();
         return false;
      }
      if(this.status_2 == "air")
      {
         this.status_1 = "sk48";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk48_h()
   {
      if(this.status_1 == "sk48_h" || this.status_2 != "air")
      {
         this.to_kick();
         return false;
      }
      if(this.status_2 == "air")
      {
         this.status_1 = "sk48_h";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk31_fake()
   {
      if(this.status_1 == "sk31" || this.status_1 == "sk31_air")
      {
         return false;
      }
      if(!this.inBurst)
      {
         if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num < 1 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num < 1)
         {
            if(this.status_1 == "sk1")
            {
               this.toStatus_switch("stand");
               return false;
            }
            return false;
         }
         this.switchSkill("sk31");
      }
      else if(this.inBurst)
      {
         this.switchSkill("sk31");
      }
   }
   function sk31()
   {
      if(this.status_1 == "sk31" || this.status_1 == "sk31_air")
      {
         return false;
      }
      if(this.status_2 == "land")
      {
         this.status_1 = "sk31";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk31_air";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk31_s()
   {
      if(this.status_1 == "sk31_s" || this.status_1 == "sk31_s_air")
      {
         return false;
      }
      if(this.status_2 == "land")
      {
         this.status_1 = "sk31_s";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk31_s_air";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
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
         this.jumpSkill("kick_l");
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatKick_l";
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "kick4";
         }
         else
         {
            _loc2_ = "kick3";
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
      if(this.status_1 == "dash_f")
      {
         _loc2_ = "dash_pl";
      }
      else if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch_l";
      }
      else
      {
         _loc2_ = "punch_l";
      }
      this.toSkill(_loc2_);
   }
}
