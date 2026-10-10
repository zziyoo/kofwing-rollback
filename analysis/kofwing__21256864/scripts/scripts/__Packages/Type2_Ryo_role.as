class Type2_Ryo_role extends Ryo_role
{
   var _x;
   var begin2;
   var burstList;
   var burst_mode;
   var dir;
   var gotoAndStop;
   var inBurst;
   var input_pre;
   var normalList2;
   var opp;
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
   var winPoseArray;
   function Type2_Ryo_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {sk10:1,sk10_l:1,sk_s3:1,sk_s3_l:1,sk_dfdb_k:1};
      this.burstList = {sk_s_q1:1,sk_s_q2:1};
      this.superMaxList = {sk12:1,sk12_l:1,sk_s3_s:1,sk_s3_s:1};
      this.skillSuperMapping = {sk10:"sk12",sk10_l:"sk12_l",sk_s3:"sk_s3_s",sk_s3_l:"sk_s3_s"};
      this.skillObj.s1 = "sk10";
      this.skillObj.s2 = "sk_s3";
      this.skillObj.busrt_a = "sk_s_q1";
      this.skillObj.busrt_d = "sk_s_q2";
      this.skillObj.toAir = "sk3_ex";
      this.skillObj.heavyHit = "heavyHit";
      this.skillObj.flyingObj = "sk1";
      this.normalList2 = ["punch_s","punch_s2"];
      this.begin2();
      this.winPoseArray = ["end2"];
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
   }
   function sk_dance_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if((this.opp.status_1 == "hold_u" || this.opp.status_1 == "hold_d") && this.opp.status_5 == "hitBack")
      {
         this.status_1 = "sk1_l";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      if(this.opp.status_2 != "land" && this.opp.status_2 != "toLand" || this.opp.status_3 == "roll")
      {
         this.status_1 = "sk1_l";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      if(this.dir == 1)
      {
         if(this.opp._x - this._x > 130)
         {
            this.status_1 = "sk1_l";
            this.status_3 = "attack";
            this.gotoAndStop(this.status_1);
            return undefined;
         }
         this.status_1 = "sk_dance";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else
      {
         if(!(this.dir == -1 && this._x - this.opp._x <= 130))
         {
            this.status_1 = "sk1_l";
            this.status_3 = "attack";
            this.gotoAndStop(this.status_1);
            return undefined;
         }
         this.status_1 = "sk_dance";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk_xf2_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk_xf2");
      this.status_1 = "sk_xf2_ai";
   }
   function sk_dance()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if((this.opp.status_1 == "hold_u" || this.opp.status_1 == "hold_d") && this.opp.status_5 == "hitBack")
      {
         this.status_1 = "sk1";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      if(this.opp.status_2 != "land" && this.opp.status_2 != "toLand" || this.opp.status_3 == "roll")
      {
         this.status_1 = "sk1";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      if(this.dir == 1)
      {
         if(this.opp._x - this._x > 130)
         {
            this.status_1 = "sk1";
            this.status_3 = "attack";
            this.gotoAndStop(this.status_1);
            return undefined;
         }
         this.status_1 = "sk_dance";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else
      {
         if(!(this.dir == -1 && this._x - this.opp._x <= 130))
         {
            this.status_1 = "sk1";
            this.status_3 = "attack";
            this.gotoAndStop(this.status_1);
            return undefined;
         }
         this.status_1 = "sk_dance";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk10_ai()
   {
      var _loc3_ = Math.random();
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      var _loc2_;
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         this.status_1 = "sk_xf2";
      }
      else
      {
         if(_loc3_ <= 1 - 0.14 * _level0.level && !this.inBurst)
         {
            _loc2_ = Math.random();
            if(this.inBurst && this.burst_mode == "power")
            {
               if(_loc2_ <= 0.5)
               {
                  this.status_1 = "sk12";
               }
               else
               {
                  this.status_1 = "sk_s3_s";
               }
            }
            else if(_loc2_ <= 0.5)
            {
               this.status_1 = "sk10";
            }
            else
            {
               this.status_1 = "sk_s3";
            }
            this.powerDecType = "super";
            this.powerDec();
            this.gotoAndStop(this.status_1);
            return true;
         }
         this.status_1 = "sk_xf2";
      }
      this.gotoAndStop(this.status_1);
   }
   function sk10_l_ai()
   {
      var _loc3_ = Math.random();
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      var _loc2_;
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         this.status_1 = "sk_xf2";
      }
      else
      {
         if(_loc3_ <= 1 - 0.14 * _level0.level && !this.inBurst)
         {
            _loc2_ = Math.random();
            if(this.inBurst && this.burst_mode == "power")
            {
               if(_loc2_ <= 0.5)
               {
                  this.status_1 = "sk12_l";
               }
               else
               {
                  this.status_1 = "sk_s3_s";
               }
            }
            else if(_loc2_ <= 0.5)
            {
               this.status_1 = "sk10_l";
            }
            else
            {
               this.status_1 = "sk_s3_l";
            }
            this.powerDecType = "super";
            this.powerDec();
            this.gotoAndStop(this.status_1);
            return true;
         }
         this.status_1 = "sk_xf2";
      }
      this.gotoAndStop(this.status_1);
   }
}
