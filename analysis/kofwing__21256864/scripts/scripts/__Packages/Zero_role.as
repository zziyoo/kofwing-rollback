class Zero_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var b;
   var begin;
   var begin2;
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
   var mode_key;
   var normalList2;
   var opp_width2;
   var pitch;
   var powerDec;
   var powerDec2;
   var powerDecType;
   var powerDecType2;
   var powerNum;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var superList;
   var superMaxList;
   var superSkill;
   var toSkill;
   var winPoseArray;
   function Zero_role()
   {
      super();
      this._roleName = "Zero";
      this.scale = 100;
      this.Vwalk = 10;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 43;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.powerNum = 1.5;
      this.superList = {dfdf_p:1,dfdf_k:1};
      this.burstList = {df_o:1,db_o:1,df_o_EX:1};
      this.superMaxList = {dfdf_p_max:1,dfdf_k_max:1};
      this.skillSuperMapping = {dfdf_p:"dfdf_p_max",dfdf_k:"dfdf_k_max",dfdf_p_can:"dfdf_p_max_can",dfdf_k_can:"dfdf_k_max_can"};
      this.winPoseArray = ["end","end2"];
      this.normalList2 = ["f_p","f_p_EX"];
      var _loc3_ = Math.random();
      if(_loc3_ > 0.5)
      {
         this.begin();
      }
      else
      {
         this.begin2();
      }
      this.skillObj.s1 = "dfdf_p";
      this.skillObj.s2 = "dfdf_k";
      this.skillObj.busrt_a = "df_o";
      this.skillObj.busrt_d = "db_o";
      this.comboClass = new Zero_Combo(this);
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
      this.input_pre.db_k = 5;
   }
   function sk_fake()
   {
      return false;
   }
   function df_o_EX()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "df_o_EX";
      this.gotoAndStop(this.status_1);
   }
   function dfdf_p_max_can()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.inBurst == true)
      {
         if(this.burst_mode == "defend" || this.burst_mode == "power")
         {
            this.powerDecType = "super";
            this.powerDec();
            this.powerDecType = "super";
            this.powerDec();
         }
         else
         {
            this.superSkill = true;
            this.powerDecType2 = "cancle";
            this.powerDecType = "super";
            this.powerDec2();
         }
      }
      else
      {
         if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num < 2 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num < 2)
         {
            return false;
         }
         this.powerDecType = "super";
         this.powerDec();
         this.powerDecType = "super";
         this.powerDec();
      }
      this.status_1 = "dfdf_p_max";
      this.status_3 = "attack";
      this.gotoAndStop("dfdf_p_max");
   }
   function dfdf_p_can()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.inBurst == true)
      {
         if(this.burst_mode == "defend" || this.burst_mode == "power")
         {
            this.powerDecType = "super";
            this.powerDec();
            this.powerDecType = "super";
            this.powerDec();
         }
         else
         {
            this.superSkill = true;
            this.powerDecType2 = "cancle";
            this.powerDecType = "super";
            this.powerDec2();
         }
      }
      else
      {
         if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num < 2 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num < 2)
         {
            return false;
         }
         this.powerDecType = "super";
         this.powerDec();
         this.powerDecType = "super";
         this.powerDec();
      }
      this.status_1 = "dfdf_p";
      this.status_3 = "attack";
      this.gotoAndStop("dfdf_p");
   }
   function dfdf_k_can()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.inBurst == true)
      {
         if(this.burst_mode == "defend" || this.burst_mode == "power")
         {
            this.powerDecType = "super";
            this.powerDec();
            this.powerDecType = "super";
            this.powerDec();
         }
         else
         {
            this.superSkill = true;
            this.powerDecType2 = "cancle";
            this.powerDecType = "super";
            this.powerDec2();
         }
      }
      else
      {
         if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num < 2 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num < 2)
         {
            return false;
         }
         this.powerDecType = "super";
         this.powerDec();
         this.powerDecType = "super";
         this.powerDec();
      }
      this.status_1 = "dfdf_k";
      this.status_3 = "attack";
      this.gotoAndStop("dfdf_k");
   }
   function dfdf_k_max_can()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.inBurst == true)
      {
         if(this.burst_mode == "defend" || this.burst_mode == "power")
         {
            this.powerDecType = "super";
            this.powerDec();
            this.powerDecType = "super";
            this.powerDec();
         }
         else
         {
            this.superSkill = true;
            this.powerDecType2 = "cancle";
            this.powerDecType = "super";
            this.powerDec2();
         }
      }
      else
      {
         if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num < 2 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num < 2)
         {
            return false;
         }
         this.powerDecType = "super";
         this.powerDec();
         this.powerDecType = "super";
         this.powerDec();
      }
      this.status_1 = "dfdf_k_max";
      this.status_3 = "attack";
      this.gotoAndStop("dfdf_k_max");
   }
   function db_k()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "lion" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "db_k";
      this.gotoAndStop(this.status_1);
   }
   function db_pl()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "krizalid" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "db_pl";
      this.gotoAndStop(this.status_1);
   }
   function db_p()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "long" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "db_p";
      this.gotoAndStop(this.status_1);
   }
   function to_kick()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         if(Key.isDown(this.d))
         {
            this.jumpSkill("kick_d");
         }
         else
         {
            this.jumpSkill("kick");
         }
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
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch_l";
      }
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         if(this.status_3 == "normal")
         {
            _loc2_ = "f_p";
         }
         else
         {
            _loc2_ = "f_p_EX";
         }
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "normal")
         {
            _loc2_ = "f_p";
         }
         else
         {
            _loc2_ = "f_p_EX";
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
