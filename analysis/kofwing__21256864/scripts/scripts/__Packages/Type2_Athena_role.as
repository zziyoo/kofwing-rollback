class Type2_Athena_role extends Athena_role
{
   var begin;
   var burstList;
   var checkSide_abs;
   var comboClass;
   var d;
   var gotoAndStop;
   var jumpSkill;
   var normalList2;
   var record_skill_totalFrame;
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
   function Type2_Athena_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {sk_dfdf_k:1,sk_s_89b:1};
      this.burstList = {sk_s_summonbao:1,sk_s_3shenji2:1,sk_s_abcd1:1};
      this.superMaxList = {sk_dfdf_k_s:1,sk_s_89b_s:1};
      this.skillSuperMapping = {sk_dfdf_k:"sk_dfdf_k_s",sk_s_89b:"sk_s_89b_s"};
      this.normalList2 = ["kick_s1","jairback","jairback2"];
      this.winPoseArray = ["end","end2"];
      var _loc10_ = Math.random();
      this.begin();
      this.skillObj.s1 = "sk_dfdf_k";
      this.skillObj.s2 = "sk_s_89b";
      this.skillObj.busrt_d = "sk_s_summonbao";
      this.skillObj.busrt_a = "sk_s_abcd1";
      this.skillObj.toAir = "sk0";
      this.record_skill_totalFrame = ["sk_s1","sk_s4","sk_s3"];
      this.comboClass.beCancled.jcd = 1;
      this.comboClass.beCancled.ja = 1;
   }
   function jairbackDo()
   {
      if(this.status_2 == "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("jairback");
      this.status_1 = "jairbackDo";
   }
   function jairback2Do()
   {
      if(this.status_2 == "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("jairback2");
      this.status_1 = "jairback2Do";
   }
   function sk_s_abcd0()
   {
      return false;
   }
   function sk_s_abcd2()
   {
      this.status_3 = "attack";
      this.status_1 = "sk_s_abcd2";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_abcd3()
   {
      this.status_3 = "attack";
      this.status_1 = "sk_s_abcd3";
      this.gotoAndStop(this.status_1);
   }
   function sk5()
   {
      if(this.status_2 == "air")
      {
         return false;
      }
      if(this.status_2 == "land")
      {
         this.status_1 = "sk5";
      }
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk5_l()
   {
      if(this.status_2 == "air")
      {
         return false;
      }
      if(this.status_2 == "land")
      {
         this.status_1 = "sk5_l";
      }
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk5_fake()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk3_air";
      }
      else if(this.status_2 == "land")
      {
         this.status_1 = "sk5_fake";
         this.status_6 = "move";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_dfdf_k()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dfdf_k_air";
      this.gotoAndStop(this.status_1);
   }
   function sk_dfdf_k_s()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dfdf_k_s_air";
      this.gotoAndStop(this.status_1);
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
      else
      {
         _loc2_ = "punch_l";
      }
      this.toSkill(_loc2_);
   }
}
