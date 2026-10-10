class Type2_Igniz_role extends Igniz_role
{
   var begin2;
   var burstList;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var superList;
   var superMaxList;
   function Type2_Igniz_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {sk_dfdfp_ex:1,sk_dfdfpl_ex:1,sk_dfdfk_ex:1,sk_bfbdf_ex:1};
      this.burstList = {sk_dfo_ex:1,sk_dbo_ex:1};
      this.superMaxList = {sk_dfdfp_ex_max:1,sk_dfdfk_ex_max:1,sk_bfbdf_ex_max:1};
      this.skillSuperMapping = {sk_dfdfp_ex:"sk_dfdfp_ex_max",sk_dfdfpl_ex:"sk_dfdfp_ex_max",sk_dfdfk_ex:"sk_dfdfk_ex_max",sk_bfbdf_ex:"sk_bfbdf_ex_max"};
      this.begin2();
      this.skillObj.s1 = "sk_dfdfp_ex";
      this.skillObj.s2 = "sk_dfdfk_ex";
      this.skillObj.s3 = "sk_dfdfpl_ex";
      this.skillObj.busrt_a = "sk_dfo_ex";
      this.skillObj.busrt_d = "sk_dbo_ex";
      this.skillObj.toAir = "sk_fdfpl_ex";
   }
}
