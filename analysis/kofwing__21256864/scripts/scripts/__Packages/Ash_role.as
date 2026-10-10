class Ash_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var ashPower;
   var b;
   var begin;
   var begin2;
   var burstList;
   var colorChange;
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
   var mc;
   var mode_key;
   var normalList2;
   var opp_width2;
   var pitch;
   var powerDec;
   var powerDecType;
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
   function Ash_role()
   {
      super();
      this._roleName = "Ash";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 43;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {dfdf_K:1,dfdf_P:1};
      this.burstList = {df_o:1,db_o:1};
      this.superMaxList = {dfdf_K_max:1,dfdf_P_max:1};
      this.skillSuperMapping = {dfdf_K:"dfdf_K_max",dfdf_P:"dfdf_P_max"};
      this.normalList2 = ["f_A","cf_A","b_B","b_D"];
      this.winPoseArray = ["end","end2"];
      var _loc3_ = Math.random();
      if(_loc3_ > 0.5)
      {
         this.begin();
      }
      else
      {
         this.begin2();
      }
      this.skillObj.s1 = "dfdf_P";
      this.skillObj.s2 = "dfdf_K";
      this.skillObj.busrt_a = "df_o";
      this.skillObj.busrt_d = "db_o";
      this.skillObj.toAir = "fdf_D";
      this.comboClass = new Ash_Combo(this);
      this.preCheck();
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-100",rb:"255",ga:"-100",gb:"100",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
      this.colorObj.green1 = {ra:"15",rb:"43",ga:"75",gb:"217",ba:"15",bb:"0",aa:"100",ab:"0"};
      this.colorObj.green2 = {ra:"50",rb:"-255",ga:"-50",gb:"255",ba:"0",bb:"0",aa:"100",ab:"0"};
      this.colorObj.ashPower1 = {ra:"50",rb:"50",ga:"50",gb:"125",ba:"50",bb:"0",aa:"100",ab:"0"};
      this.colorObj.ashPower2 = {ra:"50",rb:"50",ga:"50",gb:"175",ba:"50",bb:"0",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.bf_A = 16;
      this.input_pre.bf_C = 27;
      this.input_pre.bdf_AC = 48;
      this.input_pre.b_D = 10;
      this.input_pre.b_B = 16;
      this.input_pre.bf_A_2 = 13;
      this.input_pre.bf_C_2 = 23;
      this.input_pre.db_A = 32;
      this.input_pre.db_B = 32;
      this.input_pre.db_C = 32;
      this.input_pre.db_D = 32;
      this.input_pre.bdf_B = 21;
      this.input_pre.bdf_D = 31;
      this.input_pre.bdf_B_2 = 18;
      this.input_pre.bdf_D_2 = 25;
      this.input_pre.db_o_2 = 60;
   }
   function e_ash(blackAsh, target)
   {
      if(target == undefined)
      {
         target = this;
      }
      var _loc6_ = new flash.filters.GlowFilter(1118481,1,20,20,1.5,3,false,false);
      var _loc5_ = new Array(0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0);
      var _loc4_ = new flash.filters.ColorMatrixFilter(_loc5_);
      var _loc2_ = new Array();
      if(_level0.glowMode && blackAsh)
      {
         this.colorChange("black1",target);
         _loc2_.push(_loc6_,_loc4_);
      }
      else
      {
         _loc2_.push(_loc4_);
      }
      target.filters = _loc2_;
   }
   function df_o_2()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.status_1 = "df_o_2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_none()
   {
      return false;
   }
   function db_A()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ASH_24" && _loc3_[_loc2_].allowNum == 1 && !this.ashPower)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "db_A";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function db_B()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ASH_24" && _loc3_[_loc2_].allowNum == 1 && !this.ashPower)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "db_B";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function db_C()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ASH_24" && _loc3_[_loc2_].allowNum == 1 && !this.ashPower)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "db_C";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function db_D()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ASH_24" && _loc3_[_loc2_].allowNum == 1 && !this.ashPower)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "db_D";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function dfdf_P()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ASH_2626P" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "dfdf_P";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function dfdf_P_2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ASH_2626P_2" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "dfdf_P_2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function dfdf_P_max()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ASH_2626P2" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "dfdf_P_max";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function dfdf_P_max_2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ASH_2626P2" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "dfdf_P_max_2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function bdf_AC()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "bdf_AC";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.gotoAndStop("bdf_AC");
   }
   function dd_o()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.inBurst || this.ashPower)
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
      this.status_1 = "dd_o";
      this.status_3 = "attack";
      this.gotoAndStop("dd_o");
   }
   function db_o()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.ashPower)
      {
         return false;
      }
      this.status_1 = "db_o";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.gotoAndStop("db_o");
   }
   function f_A()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.mc.hitPos = "up";
      this.status_1 = "f_A";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function bf_A()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ASH_646A" && _loc3_[_loc2_].allowNum == 1 && !this.ashPower)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "bf_A";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function db_o_2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.ashPower)
      {
         return false;
      }
      this.status_1 = "db_o_2";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.gotoAndStop("db_o_2");
   }
   function df_o()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.ashPower)
      {
         return false;
      }
      this.status_1 = "df_o";
      this.status_3 = "attack";
      this.gotoAndStop("df_o");
   }
   function dbdf_P()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(!this.ashPower)
      {
         return false;
      }
      this.superSkill = true;
      this.status_1 = "dbdf_P";
      this.status_3 = "attack";
      this.gotoAndStop("dbdf_P");
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
      else if(Key.isDown(this.b) && this.dir == 1)
      {
         _loc2_ = "b_D";
      }
      else if(Key.isDown(this.f) && this.dir == -1)
      {
         _loc2_ = "b_D";
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
      else if(Key.isDown(this.b) && this.dir == 1 || Key.isDown(this.f) && this.dir == -1)
      {
         _loc2_ = "b_B";
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
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "cf_A";
         }
         else
         {
            _loc2_ = "f_A";
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
