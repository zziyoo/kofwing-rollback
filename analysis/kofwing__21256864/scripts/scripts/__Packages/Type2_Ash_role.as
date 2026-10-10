class Type2_Ash_role extends Ash_role
{
   var b;
   var begin2;
   var burstList;
   var checkSide_abs;
   var colorObj;
   var d;
   var dir;
   var f;
   var getObjs;
   var gotoAndStop;
   var jumpSkill;
   var mode_key;
   var pitch;
   var powerDec;
   var powerDecType;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var superList;
   var superMaxList;
   var superSkill;
   var toSkill;
   var winPoseArray;
   function Type2_Ash_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {dfdf_P_2:1,dfdf_K:1};
      this.burstList = {df_o_2:1,db_o_2:1,dd_o_2:1};
      this.superMaxList = {dfdf_P_max_2:1,dfdf_K_max:1};
      this.skillSuperMapping = {dfdf_P_2:"dfdf_P_max_2",dfdf_K:"dfdf_K_max"};
      this.begin2();
      this.winPoseArray = ["end3"];
      this.skillObj.s1 = "dfdf_P_2";
      this.skillObj.s2 = "dfdf_K";
      this.skillObj.busrt_a = "dd_o_2";
      this.skillObj.burst_c = "df_o_2";
      this.skillObj.busrt_d = "db_o_2";
      this.skillObj.toAir = "fdf_D";
      this.colorObj.nonSkill2 = {ra:"-25",rb:"25",ga:"-25",gb:"25",ba:"-25",bb:"25",aa:"100",ab:"0"};
      this.colorObj.nonSkill1 = {ra:"15",rb:"0",ga:"15",gb:"0",ba:"15",bb:"0",aa:"100",ab:"0"};
   }
   function dd_o_2()
   {
      if(this.status_2 != "land")
      {
         this.checkSide_abs();
         this.status_1 = "df_o_2";
      }
      else
      {
         this.status_1 = "dd_o_2";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function bf_A_2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ASH_646A_02" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "bf_A_2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function dbdf_P_2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num < 1 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num < 1)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.superSkill = true;
      this.status_1 = "dbdf_P_2";
      this.status_3 = "attack";
      this.gotoAndStop("dbdf_P_2");
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
      else if(Key.isDown(this.b) && this.dir == 1)
      {
         _loc2_ = "b_B";
      }
      else if(Key.isDown(this.f) && this.dir == -1)
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
