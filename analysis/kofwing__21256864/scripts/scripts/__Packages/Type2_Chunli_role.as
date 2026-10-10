class Type2_Chunli_role extends Chunli_role
{
   var begin2;
   var burstList;
   var burst_mode;
   var checkSide_abs;
   var gotoAndStop;
   var inBurst;
   var normalList2;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var superList;
   var superMaxList;
   var toSkill;
   function Type2_Chunli_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {sk_s_qianlie_air:1,sk_s_bo2:1,sk_s_qianlie_air2:1};
      this.burstList = {sk_s_tianxing:1,sk_s_zuhe:1};
      this.superMaxList = {sk_s_qianlie_air_s:1,sk_s_bo2_s:1,sk_s_qianlie_air_s2:1};
      this.skillSuperMapping = {sk_s_bo2:"sk_s_bo2_s",sk_s_qianlie_air:"sk_s_qianlie_air_s",sk_s_qianlie_air2:"sk_s_qianlie_air_s2"};
      this.normalList2 = ["kick_s1","sk_bashan","jump_2d","jump_2d2","jump_2d3"];
      this.begin2();
      this.skillObj.s1 = "sk_s_bo2";
      this.skillObj.s2 = "sk_s_qianlie_air";
      this.skillObj.s3 = "sk_s_qianlie_air2";
      this.skillObj.busrt_a = "sk_s_zuhe";
      this.skillObj.busrt_d = "sk_s_tianxing";
   }
   function kick_s3()
   {
      if(this.status_2 == "air")
      {
         this.toSkill("sk_s_qianlie_air2");
         this.checkSide_abs();
         if(this.inBurst == true && this.burst_mode == "power")
         {
            this.sk_s_qianlie_air_s2();
         }
         else if(this.inBurst == true || this == _level0.P1_role && _level0.LP_P1.powerPoint_num > 0 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num > 0)
         {
            this.sk_s_qianlie_air2();
         }
         return undefined;
      }
      this.status_1 = "kick_s1";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_huixuan()
   {
      if(this.status_2 == "air")
      {
         this.sk_chuantui();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_huixuan";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_huixuan2()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk_chuantui();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_huixuan2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_chuantui()
   {
      if(this.status_1 == "sk_huixuan2")
      {
         return false;
      }
      this.status_1 = "sk_chuantui";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_bailietui2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_bailietui2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_s_qianlie_air()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk_s_qianlie_air2();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_s_qianlie_air";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_s_qianlie_air_s()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk_s_qianlie_air_s2();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_s_qianlie_air_s";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_s_qianlie_air2()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.status_1 = "sk_s_qianlie_air2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_s_qianlie_air_s2()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.status_1 = "sk_s_qianlie_air_s2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
}
