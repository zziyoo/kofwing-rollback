class Type2_Rugal_role extends Rugal_role
{
   var burstList;
   var checkSide_abs;
   var gotoAndStop;
   var mc;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var superList;
   var superMaxList;
   var winPoseArray;
   function Type2_Rugal_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {dfdb_p:1,dfdf_k:1};
      this.burstList = {df_o_EX:1,db_o_EX:1};
      this.superMaxList = {dfdb_p_max:1,dfdf_k_max:1};
      this.skillSuperMapping = {dfdb_p:"dfdb_p_max",dfdf_k:"dfdf_k_max"};
      this.gotoAndStop("begin2");
      this.winPoseArray = ["end2"];
      this.skillObj.s1 = "dfdb_p";
      this.skillObj.s2 = "dfdf_k";
      this.skillObj.busrt_a = "df_o_EX";
      this.skillObj.busrt_d = "db_o_EX";
      this.skillObj.toAir = "fdf_k3";
      this.skillObj.flyingObj = "fbdf_p_EX";
   }
   function df_p_EX()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.df_p_air_EX();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.status_1 == "df_p_EX")
      {
         return false;
      }
      this.status_1 = "df_p_EX";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function df_p_air_EX()
   {
      this.status_1 = "df_p_air_EX";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function db_o_EX()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "db_o_EX";
      this.status_3 = "attack";
      this.mc.hitPos = "all";
      this.gotoAndStop(this.status_1);
   }
}
