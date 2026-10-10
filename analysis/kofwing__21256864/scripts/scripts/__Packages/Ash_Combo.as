class Ash_Combo extends role_corn.Combo_listener
{
   var beCancled;
   var combo1;
   var combo2;
   var combo3;
   var noCancle;
   var notTOcancle;
   var role;
   var s_cancle;
   var skill_over;
   function Ash_Combo(r)
   {
      super();
      this.role = r;
      this.init();
   }
   function init()
   {
      this.combo1 = new Object();
      this.combo1.f_A = {cf_A:"sk_none",b_D:"sk_none",b_B:"sk_none"};
      this.combo1.cf_A = {f_A:"sk_none",b_D:"sk_none",b_B:"sk_none"};
      this.combo1.b_D = {b_B:"sk_none"};
      this.combo1.b_B = {b_D:"sk_none"};
      this.combo2 = new Object();
      this.combo3 = new Object();
      this.skill_over = new Object();
      this.combo2.punch_l = 4;
      this.skill_over.punch_l = 5;
      this.combo2.punch = 9;
      this.skill_over.punch = 12;
      this.combo2.punch2 = 6;
      this.combo3.punch2 = 5;
      this.skill_over.punch2 = 16;
      this.combo2.punch_l2 = 5;
      this.skill_over.punch_l2 = 8;
      this.combo2.kick_l2 = 6;
      this.skill_over.kick_l2 = 12;
      this.combo2.kick_l = 8;
      this.skill_over.kick_l = 10;
      this.combo2.kick2 = 6;
      this.combo3.kick2 = 5;
      this.skill_over.kick2 = 13;
      this.combo2.squatPunch = 4;
      this.skill_over.squatPunch = 16;
      this.combo2.squatPunch_l = 4;
      this.skill_over.squatPunch_l = 5;
      this.combo2.squatKick_l = 4;
      this.skill_over.squatKick_l = 6;
      this.combo2.squatKick = 6;
      this.skill_over.squatKick = 11;
      this.combo2.heavyHit = 9;
      this.skill_over.heavyHit = 15;
      this.combo2.b_B = 8;
      this.skill_over.b_B = 15;
      this.combo2.b_D = 5;
      this.skill_over.b_D = 8;
      this.combo2.f_A = 13;
      this.skill_over.f_A = 24;
      this.combo2.cf_A = 8;
      this.skill_over.cf_A = 16;
      this.combo2.bdf_AC = 36;
      this.skill_over.bdf_AC = 51;
      this.combo2.fdf_D = 4;
      this.skill_over.fdf_D = 16;
      this.combo2.fdf_B = 3;
      this.skill_over.fdf_B = 12;
      this.combo2.bf_A_2 = 9;
      this.combo3.bf_A_2 = 16;
      this.skill_over.bf_A_2 = 16;
      this.combo2.bf_A = 10;
      this.combo3.bf_A = 17;
      this.skill_over.bf_A = 17;
      this.combo2.bf_C_2 = 20;
      this.combo3.bf_C_2 = 29;
      this.skill_over.bf_C_2 = 29;
      this.combo2.bf_C = 13;
      this.combo3.bf_C = 24;
      this.skill_over.bf_C = 24;
      this.combo2.db_A = 16;
      this.combo3.db_A = 32;
      this.skill_over.db_A = 32;
      this.combo2.db_B = 16;
      this.combo3.db_B = 32;
      this.skill_over.db_B = 32;
      this.combo2.db_C = 16;
      this.combo3.db_C = 16;
      this.skill_over.db_C = 32;
      this.combo2.db_D = 16;
      this.combo3.db_C = 16;
      this.skill_over.db_D = 32;
      this.combo2.bdf_B = 9;
      this.combo3.bdf_B = 16;
      this.skill_over.bdf_B = 16;
      this.combo2.bdf_B_2 = 9;
      this.combo3.bdf_B_2 = 13;
      this.skill_over.bdf_B_2 = 13;
      this.combo2.bdf_D = 15;
      this.combo3.bdf_D = 24;
      this.skill_over.bdf_D = 24;
      this.combo2.bdf_D_2 = 10;
      this.combo3.bdf_D_2 = 16;
      this.skill_over.bdf_D_2 = 16;
      this.combo2.bdf_B_ex = 9;
      this.skill_over.bdf_B_ex = 10;
      this.combo2.bdf_D_ex = 12;
      this.skill_over.bdf_D_ex = 18;
      this.combo2.dfdf_K = 5;
      this.skill_over.dfdf_K = 41;
      this.skill_over.db_o = 137;
      this.beCancled = new Object();
      this.beCancled.punch = 1;
      this.beCancled.punch2 = 1;
      this.beCancled.kick_s1 = 1;
      this.beCancled.punch_l = 1;
      this.beCancled.kick_l2 = 1;
      this.beCancled.punch_l2 = 1;
      this.beCancled.kick = 1;
      this.beCancled.kick2 = 1;
      this.beCancled.kick_s1 = 1;
      this.beCancled.kick_s2 = 1;
      this.beCancled.kick_l = 1;
      this.beCancled.f_p = 1;
      this.beCancled.b_B = 1;
      this.beCancled.b_D = 1;
      this.beCancled.f_A = 1;
      this.beCancled.cf_A = 1;
      this.beCancled.df_p = 1;
      this.beCancled.squatPunch = 1;
      this.beCancled.squatPunch_l = 1;
      this.beCancled.squatKick_l = 1;
      this.beCancled.squatKick = 1;
      this.beCancled.jumpSkill_punch = 1;
      this.beCancled.df_ph = 12;
      if(this.role.roleMode == 2)
      {
         this.beCancled.bdf_B = 1;
         this.beCancled.bdf_B_ex = 1;
         this.beCancled.bdf_D = 1;
         this.beCancled.bdf_D_ex = 1;
         this.beCancled.squatKick = 1;
         this.beCancled.b_D = 1;
         this.beCancled.b_B = 1;
      }
      this.notTOcancle = new Object();
      this.notTOcancle.punch = 1;
      this.notTOcancle.punch2 = 1;
      this.notTOcancle.punch_l = 1;
      this.notTOcancle.kick = 1;
      this.notTOcancle.kick_l = 1;
      this.notTOcancle.squatPunch_l = 1;
      this.notTOcancle.squatPunch = 1;
      this.notTOcancle.squatKick = 1;
      if(this.role.roleMode == 1)
      {
         this.notTOcancle.squatKick_l = 1;
      }
      this.notTOcancle.pitch = 1;
      this.notTOcancle.pitch2 = 1;
      this.noCancle = new Object();
      this.noCancle.f_A = "cf_A";
      this.noCancle.b_B = "b_D";
      this.noCancle.b_D = "b_B";
      this.s_cancle = new Object();
      this.s_cancle.punch_l = {kick_l:1,squatPunch:1,punch:1,kick:1,squatKick:1};
      this.s_cancle.punch_l2 = {kick_l:1,squatPunch:1,punch:1,kick:1,squatKick:1};
      this.s_cancle.kick_l = {squatPunch:1,punch:1,kick:1,squatKick:1};
      this.s_cancle.kick_l2 = {squatPunch:1,punch:1,kick:1,squatKick:1};
      this.s_cancle.squatPunch_l = {kick_l:1,squatPunch:1,punch:1,kick:1,squatKick:1};
      this.s_cancle.squatKick_l = {kick_l:1,squatPunch:1,punch:1,kick:1,squatKick:1};
      if(this.role.roleMode == 2)
      {
         this.beCancled.bdf_B = 1;
         this.beCancled.bdf_B_ex = 1;
         this.beCancled.bdf_D = 1;
         this.beCancled.bdf_D_ex = 1;
         this.beCancled.squatKick = 1;
         this.beCancled.b_D = 1;
         this.beCancled.b_B = 1;
         this.s_cancle.bdf_B = {b_D:1,b_B:1,squatKick:1};
         this.s_cancle.bdf_B_ex = {b_D:1,b_B:1,squatKick:1};
         this.s_cancle.bdf_D = {b_D:1,b_B:1};
         this.s_cancle.bdf_D_ex = {b_D:1,b_B:1};
         this.s_cancle.b_D = {squatKick:1,squatKick_l:1};
         this.s_cancle.b_B = {squatKick:1,squatKick_l:1};
      }
   }
}
