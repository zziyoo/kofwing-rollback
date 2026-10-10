class Type2_KyoW_role extends KyoW_role
{
   var burstList;
   var checkSide_abs;
   var getObjs;
   var gotoAndStop;
   var land;
   var normalList2;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var superList;
   var superMaxList;
   var winPoseArray;
   function Type2_KyoW_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {sk_s_120:1,sk31:1};
      this.burstList = {sk_neoMax:1,sk_max3:1,sk_shenchen:1,sk_shenchen2:1};
      this.superMaxList = {sk_s_120_s:1,sk31_s:1};
      this.skillSuperMapping = {sk_s_120:"sk_s_120_s",sk31:"sk31_s"};
      this.normalList2 = ["jumpSkill_punch_s","squatKick_s","kick1","kick3","airBack"];
      this.winPoseArray = ["end","end3"];
      this.skillObj.s1 = "sk_s_120";
      this.skillObj.s2 = "sk31";
      this.skillObj.busrt_a = "sk_neoMax";
      this.skillObj.busrt_d = "sk_max3";
      this.skillObj.burst_f = "sk_shenChen";
   }
   function sk31_s()
   {
      if(this.status_1 == "sk31_s")
      {
         return false;
      }
      if(this.status_2 == "air")
      {
         this.status_1 = "sk31_max_air";
         this.checkSide_abs();
      }
      else
      {
         this.status_1 = "sk31_s";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk30()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "yangyan" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "sk30";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk30_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "yangyan2" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "sk30_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk21_2s_ai()
   {
      if(this.status_2 != this.land)
      {
         return false;
      }
      this.status_3 == "attack";
      this.gotoAndStop("sk21_2s");
      this.status_1 = "sk21_2s_ai";
   }
   function sk19s_ai()
   {
      if(this.status_2 != this.land)
      {
         return false;
      }
      this.status_3 == "attack";
      this.gotoAndStop("sk19s");
      this.status_1 = "sk19s_ai";
   }
   function sk_shenchen2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_shenchen2";
      this.gotoAndStop(this.status_1);
   }
   function canggui2()
   {
      if(this.status_1 == "sk_canggui" || this.status_1 == "sk_canggui3" || this.status_1 == "sk_cangguinull")
      {
         return false;
      }
      this.status_1 = "canggui2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function canggui()
   {
      if(this.status_1 == "sk_canggui" || this.status_1 == "sk_canggui3" || this.status_1 == "sk_cangguinull")
      {
         return false;
      }
      this.status_1 = "canggui2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
}
