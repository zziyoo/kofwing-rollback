class Igniz_role extends role_corn.Role
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
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var egde_max;
   var egde_min;
   var f;
   var getObjs;
   var gotoAndStop;
   var input_pre;
   var jumpSkill;
   var mc;
   var mode_key;
   var onHit;
   var opp;
   var opp_width2;
   var pitch;
   var powerNum;
   var record_skill_totalFrame;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var superList;
   var superMaxList;
   var toSkill;
   var winPoseArray;
   function Igniz_role()
   {
      super();
      this._roleName = "Igniz";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 43;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.powerNum = 1.5;
      this.superList = {dfdf_p:1,dfdf_k:1,dfdb_p:1};
      this.burstList = {df_o:1,db_o:1};
      this.superMaxList = {dfdf_p_max:1,dfdf_k_max:1,dfdb_p_max:1};
      this.skillSuperMapping = {dfdf_p:"dfdf_p_max",dfdf_k:"dfdf_k_max",dfdb_p:"dfdb_p_max"};
      this.record_skill_totalFrame = ["fdf_p"];
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
      this.skillObj.s1 = "dfdf_p";
      this.skillObj.s2 = "dfdf_k";
      this.skillObj.s3 = "dfdb_p";
      this.skillObj.busrt_a = "df_o";
      this.skillObj.busrt_d = "db_o";
      this.skillObj.toAir = "fdf_p";
      this.comboClass = new Igniz_Combo(this);
      this.preCheck();
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-100",rb:"255",ga:"-100",gb:"100",ba:"-100",bb:"0",aa:"100",ab:"0"};
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
      this.input_pre.sk_fdbpl_ex = 20;
      this.input_pre.sk_fdbp_ex = 20;
      this.input_pre.sk_fdbkl_ex = 20;
      this.input_pre.sk_fdbk_ex = 20;
      this.input_pre.sk_bdbp_ex = 31;
      this.input_pre.sk_bdfpl_ex = 17;
      this.input_pre.sk_bdfp_ex = 22;
   }
   function catch_oppPos21(obj, obj2, status_c, flag, condition_land, condition_hurt, downHit, oppDirChange, rollHit, condition_air, hitID)
   {
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
      if(obj.hitTest(this.opp.mc.body) || rollHit && obj.hitTest(this.opp) && this.opp.status_3 == "roll" || obj.hitTest(this.opp.mc))
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
         if(_loc3_[_loc2_].objName == "Igniz_shanzi2" && _loc3_[_loc2_].allowNum == 2)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "db_pl";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function db_k()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "db_k";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      this.mc.hitPos = "all";
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
