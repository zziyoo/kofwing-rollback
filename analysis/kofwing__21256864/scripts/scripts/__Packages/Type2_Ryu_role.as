class Type2_Ryu_role extends Ryu_role
{
   var b;
   var begin2;
   var burstList;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var input_pre;
   var jumpSkill;
   var mc;
   var normalList2;
   var pitch;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var superList;
   var superMaxList;
   var toSkill;
   var winPoseArray;
   function Type2_Ryu_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {sk10:1,sk_bd_air:1,sk_s3:1};
      this.burstList = {sk_s_q1:1,sk_s_q2:1};
      this.superMaxList = {sk12:1,sk_bd_air_s:1,sk_s3_s:1};
      this.skillSuperMapping = {sk10:"sk12",sk_bd_air:"sk_bd_air_s",sk_s3:"sk_s3_s"};
      this.normalList2 = ["sk_d1","kick1","kick3","punch_s","punch_b"];
      this.skillObj.s1 = "sk10";
      this.skillObj.s2 = "sk_s3";
      this.skillObj.s3 = "sk_bd_air";
      this.skillObj.busrt_a = "sk_s_q1";
      this.skillObj.busrt_d = "sk_s_q2";
      this.skillObj.toAir = "sk3";
      this.skillObj.heavyHit = "heavyHit";
      this.skillObj.flyingObj = "sk1";
      this.begin2();
      this.winPoseArray = ["end2"];
   }
   function preCheck()
   {
      this.input_pre.kick1 = 9;
   }
   function sk1()
   {
      if(this.status_2 == "air")
      {
         this.sk_bodong_air2other();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk1";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk1_l()
   {
      if(this.status_2 == "air")
      {
         this.sk_bodong_air2other();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk1_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_bodong_airother()
   {
      if(this.status_2 == "air" && this.status_1 != "kick1")
      {
         this.sk_bodong_air2other();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.status_1 == "kick1")
      {
         return false;
      }
      this.status_1 = "sk_bodong_airother";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_bodong_air2other()
   {
      if(this.status_1 == "kick1")
      {
         return false;
      }
      this.status_1 = "sk_bodong_air2other";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_xf2()
   {
      if(this.status_1 == "jump_b" || this.status_1 == "dash_b")
      {
         this.sk4_2();
         return undefined;
      }
      if(this.status_2 == "air")
      {
         this.sk4_1();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_xf2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk4_1()
   {
      this.status_1 = "sk4_1";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk4_2()
   {
      this.status_1 = "sk4_2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_BGX_ai()
   {
      this.status_3 = "attack";
      this.gotoAndStop("sk_BGX");
      this.status_1 = "sk_BGX_ai";
   }
   function sk_BGX_s2()
   {
      if(this.mc.played || this.status_2 == "land")
      {
         return false;
      }
      this.mc.played = true;
      this.status_1 = "sk_BGX_s2";
      this.status_3 = "attack";
      this.mc.gotoAndPlay("s2");
   }
   function sk_BGX_s3()
   {
      if(this.mc.played || this.status_2 == "land")
      {
         return false;
      }
      this.mc.played = true;
      this.status_1 = "sk_BGX_s3";
      this.status_3 = "attack";
      this.mc.gotoAndPlay("s3");
   }
   function to_punch()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         if(Key.isDown(this.d))
         {
            this.jumpSkill("punch_s");
         }
         else
         {
            this.jumpSkill("punch");
         }
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
      else if(Key.isDown(this.b) && this.dir == 1 || Key.isDown(this.f) && this.dir == -1)
      {
         _loc2_ = "punch_b";
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
