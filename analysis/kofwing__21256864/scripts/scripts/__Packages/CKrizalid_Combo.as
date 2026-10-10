class CKrizalid_Combo extends role_corn.Combo_listener
{
   var beCancled;
   var combo1;
   var combo2;
   var notTOcancle;
   var role;
   var s_cancle;
   var skill_over;
   function CKrizalid_Combo(r)
   {
      super();
      this.role = r;
      this.init();
   }
   function init()
   {
      this.combo1 = new Object();
      this.combo2 = new Object();
      this.skill_over = new Object();
      this.combo2.jp = 1;
      this.combo2.jk = 1;
      this.combo2.punch_l = 4;
      this.skill_over.punch_l = 5;
      this.combo2.punch = 8;
      this.skill_over.punch = 11;
      this.combo2.punch2 = 8;
      this.skill_over.punch2 = 11;
      this.combo2.kick_l = 8;
      this.skill_over.kick_l = 9;
      this.combo2.kick_lc = 8;
      this.skill_over.kick_lc = 9;
      this.combo2.kick = 13;
      this.skill_over.kick = 15;
      this.combo2.kick2 = 13;
      this.skill_over.kick2 = 15;
      this.combo2.squatPunch = 8;
      this.skill_over.squatPunch = 11;
      this.combo2.squatPunch_l = 4;
      this.skill_over.squatPunch_l = 5;
      this.combo2.squatKick = 5;
      this.skill_over.squatKick = 6;
      this.combo2.squatKick_l = 5;
      this.skill_over.squatKick_l = 6;
      this.combo2.heavyHit = 10;
      this.skill_over.heavyHit = 12;
      this.combo2.powerCD = 20;
      this.skill_over.powerCD = 22;
      this.combo2.df_ph = 10;
      this.skill_over.df_ph = 20;
      this.combo2.df_pl = 12;
      this.skill_over.df_pl = 20;
      this.combo2.df_kl = 7;
      this.skill_over.df_kl = 10;
      this.combo2.df_kh = 7;
      this.skill_over.df_kh = 10;
      this.beCancled = new Object();
      this.beCancled.punch = 1;
      this.beCancled.punch2 = 1;
      this.beCancled.punch_l = 1;
      this.beCancled.kick = 1;
      this.beCancled.kick2 = 1;
      this.beCancled.kick_s1 = 1;
      this.beCancled.kick_s2 = 1;
      this.beCancled.kick_l = 1;
      this.beCancled.kick_lc = 1;
      this.beCancled.heavyHit = 1;
      this.beCancled.powerCD = 1;
      this.beCancled.squatPunch = 1;
      this.beCancled.squatPunch_l = 1;
      this.beCancled.squatKick_l = 1;
      this.beCancled.squatKick = 1;
      this.beCancled.jp = 1;
      this.beCancled.jk = 1;
      this.notTOcancle = new Object();
      this.notTOcancle.punch = 1;
      this.notTOcancle.punch2 = 1;
      this.notTOcancle.punch_l = 1;
      this.notTOcancle.kick = 1;
      this.notTOcancle.kick_l = 1;
      this.notTOcancle.kick_lc = 1;
      this.notTOcancle.squatPunch = 1;
      this.notTOcancle.squatPunch_l = 1;
      this.notTOcancle.squatKick_l = 1;
      this.notTOcancle.squatKick = 1;
      this.notTOcancle.pitch = 1;
      this.s_cancle = new Object();
      this.s_cancle.punch_l = {kick_l:1,squatPunch_l:1,squatKick_l:1,punch:1,kick:1};
      this.s_cancle.kick_l = {punch:1,kick:1};
      this.s_cancle.squatPunch_l = {punch_l:1,kick_l:1,squatKick_l:1,punch:1,kick:1};
      this.s_cancle.squatKick_l = {punch_l:1,kick_l:1,punch:1,kick:1};
   }
}
