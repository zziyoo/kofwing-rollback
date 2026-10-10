class Type3_Iori_role extends Iori_role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var b;
   var begin3;
   var burstList;
   var comboClass;
   var d;
   var dir;
   var f;
   var getObjs;
   var gotoAndStop;
   var inBurst;
   var jumpSkill;
   var normalList2;
   var opp_width2;
   var pitch;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var superList;
   var superMaxList;
   var toSkill;
   var winPoseArray;
   function Type3_Iori_role()
   {
      super();
      this.roleMode = 3;
      this.Vwalk = 17;
      this.Vdash = 32;
      this.Vjump_x = 18;
      this.Vjump_y = 33;
      this.Vjump_far = 21;
      this.opp_width2 = 60;
      this.superList = {sk_s1o:1,sk_s2:1,sk_s_89b:1};
      this.burstList = {sk_s_qianzai1:1,sk_s_qianzai2o:1,sk_max3:1};
      this.superMaxList = {sk_s1_s:1,sk_s2_s:1,sk_s_89b_s:1};
      this.skillSuperMapping = {sk_s1o:"sk_s1_s",sk_s2:"sk_s2_s",sk_s_89b:"sk_s_89b_s"};
      this.normalList2 = ["punch_s1","punch_s2","kick_s1","airBack","jumpSilll_kick_s"];
      this.begin3();
      this.winPoseArray = ["end3"];
      this.skillObj.s1 = "sk_s1o";
      this.skillObj.s2 = "sk_s_89b";
      this.skillObj.busrt_a = "sk_s_qianzai1";
      this.skillObj.busrt_d = "sk_s_qianzai2o";
      this.comboClass.combo2.sk_s1 = 146;
      this.comboClass.combo2.sk_s2 = 60;
      this.comboClass.skill_over.sk_s1o = 158;
      this.comboClass.skill_over.sk_s1_s = 185;
      this.comboClass.skill_over.sk_s2 = 15;
      this.comboClass.skill_over.sk_s2_s = 15;
      this.comboClass.skill_over.sk_s_qianzai1 = 128;
      this.comboClass.skill_over.sk_s_qianzai2o = 54;
   }
   function sk3o()
   {
      if(this.status_2 != "land" || this.status_1 == "sk3o")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk3o";
      this.gotoAndStop(this.status_1);
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
   function sk2o()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "Iori_fire3_o" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "sk2o";
      this.gotoAndStop(this.status_1);
   }
}
