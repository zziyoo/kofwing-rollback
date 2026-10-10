class Type3_Goenitz_role extends Goenitz_role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _x;
   var _y;
   var b;
   var begin;
   var burstList;
   var burst_mode;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var inBurst;
   var input_pre;
   var jumpSkill;
   var land_Y;
   var opp;
   var opp_width2;
   var pitch;
   var powerDec;
   var powerDec2;
   var powerDecType;
   var powerDecType2;
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
   function Type3_Goenitz_role()
   {
      function preCheck()
      {
         this.input_pre.roll_f = 10;
         this.input_pre.roll_b = 10;
         this.input_pre.land = 0;
         this.input_pre.land2 = 0;
         this.input_pre.getup1 = 20;
         this.input_pre.getup2 = 20;
         this.input_pre.binghe_d = 18;
      }
      super();
      this.Vwalk = 11;
      this.Vdash = 35;
      this.Vjump_x = 13;
      this.Vjump_y = 38;
      this.Vjump_far = 19;
      this.opp_width2 = 65;
      this.superList = {sk_s1:1,sk_s1_k:1,sk_s2:1,sk_s3:1,fsyc:1,fsyc_h:1,sk_s1_s:1};
      this.burstList = {sk_s_qianzai1:1,sk_s_qianzai2:1};
      this.superMaxList = {sk_s1_s:1,sk_s1_s2:1,sk_s2_s:1,fsyc_s:1};
      this.skillSuperMapping = {sk_s1:"sk_s1_s",sk_s1_k:"sk_s1_k_s",sk_s2:"sk_s2_s",fsyc:"fsyc_s",fsyc_h:"fsyc_s"};
      this.begin();
      this.winPoseArray = ["end1"];
      this.skillObj.s1 = "sk_s1_k";
      this.skillObj.s2 = "fsyc_h";
      this.skillObj.busrt_a = "sk_s_qianzai1";
      this.skillObj.busrt_d = "sk_s_qianzai1";
      this.comboClass = new Goenitz_Combo(this);
      preCheck();
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
   function getDis()
   {
      var _loc2_ = Math.abs(this._x - this.opp._x);
      if(isNaN(_loc2_))
      {
         _loc2_ = 60;
      }
      return _loc2_;
   }
   function getOwnerHeight()
   {
      var _loc2_ = Math.abs(this._y - this.land_Y);
      if(isNaN(_loc2_))
      {
         _loc2_ = 0;
      }
      if(this._y < 0)
      {
         _loc2_ = this.land_Y;
      }
      if(this.status_2 != "air")
      {
         _loc2_ = 0;
      }
      return _loc2_;
   }
   function getOppHeight()
   {
      var _loc2_ = Math.abs(this.opp._y - this.land_Y);
      if(isNaN(_loc2_))
      {
         _loc2_ = 0;
      }
      if(this._y < 0)
      {
         _loc2_ = this.land_Y;
      }
      if(this.opp.status_2 != "air")
      {
         _loc2_ = 0;
      }
      return _loc2_;
   }
   function binghe_d()
   {
      if(this.status_1 == "binghe_d")
      {
         return false;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "binghe_d";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function binghe_t()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "binghe_t";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_s3()
   {
      if(this.status_1 == "sk_s3")
      {
         return false;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_s3";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.gotoAndStop(this.status_1);
   }
   function sk_s2()
   {
      if(this.status_1 == "sk_s2")
      {
         return false;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_s2";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.gotoAndStop(this.status_1);
   }
   function sk_s2_s()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_s2_s";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.gotoAndStop(this.status_1);
   }
   function sk_s1_s()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.inBurst == true)
      {
         if(this.burst_mode == "defend" || this.burst_mode == "attack")
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
      this.status_1 = "sk_s1_s";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_s2_Li()
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
      this.status_1 = "sk_s2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_s2_s_Li()
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
      this.status_1 = "sk_s2_s";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_qianzai1()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.status_1 == "sk_s_qianzai1")
      {
         return false;
      }
      this.status_1 = "sk_s_qianzai1";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function xczl_0()
   {
      return false;
   }
   function yefeng_land()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk1_1_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function yefeng_back()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk1_1";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function wind_back()
   {
      if(!((this.opp.status_3 == "hurt" || this.opp.status_3 == "down") && this.opp.status_7 == "yefeng"))
      {
         return false;
      }
      this.status_1 = "wind_back";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function wind_land()
   {
      if(!((this.opp.status_3 == "hurt" || this.opp.status_3 == "down") && this.opp.status_7 == "yefeng"))
      {
         return false;
      }
      this.status_1 = "wind_land";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_qianzai1_n()
   {
      if(!(this.status_1 == "sk_s_qianzai1" && this.opp.status_3 != "hurt" && this.opp.status_1 != "hurt1"))
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk_s_qianzai1_next");
      this.status_1 = "sk_s_qianzai1_n";
   }
   function sk_s_qianzai1_n2()
   {
      if(!(this.status_1 == "sk_s_qianzai1" && this.opp.status_3 != "hurt" && this.opp.status_1 != "hurt1"))
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk_s_qianzai1_next2");
      this.status_1 = "sk_s_qianzai1_n2";
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
}
