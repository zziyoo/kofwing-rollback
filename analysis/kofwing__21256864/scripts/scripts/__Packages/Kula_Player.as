class Kula_Player extends Kula_role
{
   var attachMovie;
   var b;
   var d;
   var f;
   var getNextHighestDepth;
   var h;
   var k;
   var k_l;
   var key_array;
   var mode_key;
   var newKeyControl;
   var noAct;
   var p;
   var p_l;
   var qq;
   var s;
   var s2;
   var skill_array;
   var skill_mapping;
   var toAction;
   var toAction_temp;
   var toSkill;
   var toSkill_temp;
   var toStatus;
   var toStatus_temp;
   var u;
   function Kula_Player()
   {
      super();
      this.toSkill_temp = this.toSkill;
      this.toAction_temp = this.toAction;
      this.toStatus_temp = this.toStatus;
      this.toSkill = this.noAct;
      this.toAction = this.noAct;
   }
   function init(key, _mode_key)
   {
      this.key_array = key;
      this.mode_key = _mode_key;
      this.setKey();
      this.skill_array = new Array();
      this.skill_mapping = new Array();
      if(this.mode_key == "easy")
      {
         this.skill_code_easy();
      }
      else
      {
         this.skill_code();
      }
      Object.registerClass("KeyControl",role_corn.KeyControl);
      this.attachMovie("KeyControl","newKeyControl",this.getNextHighestDepth());
      this.newKeyControl.init(this.key_array,this.skill_array,this.skill_mapping,this);
   }
   function setKey()
   {
      this.u = this.key_array[0].u;
      this.d = this.key_array[0].d;
      this.f = this.key_array[0].f;
      this.b = this.key_array[0].b;
      this.p = this.key_array[0].p;
      this.k = this.key_array[0].k;
      this.p_l = this.key_array[0].p_l;
      this.k_l = this.key_array[0].k_l;
      this.s = this.key_array[0].s;
      this.s2 = this.key_array[0].s2;
      this.h = this.key_array[0].h;
      this.qq = this.key_array[0].qq;
   }
   function skill_code()
   {
      this.skill_array.push([this.d,this.b,this.s]);
      this.skill_mapping.push(["sk_s_xingchen"]);
      this.skill_array.push([this.d,this.f,this.s]);
      this.skill_mapping.push(["sk_s_jiejie"]);
      this.skill_array.push([this.d,this.f,this.d,this.f,this.p]);
      this.skill_mapping.push(["sk_s_bingren"]);
      this.skill_array.push([this.d,this.f,this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_s_luanwu"]);
      this.skill_array.push([this.d,this.f,this.b,this.p]);
      this.skill_mapping.push(["sk_s_luanwu"]);
      this.skill_array.push([this.d,this.f,this.d,this.f,this.k]);
      this.skill_mapping.push(["sk_tibing"]);
      this.skill_array.push([this.f,this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_bingdian"]);
      this.skill_array.push([this.f,this.d,this.f,this.p_l]);
      this.skill_mapping.push(["sk_fdfp_l"]);
      this.skill_array.push([this.f,this.d,this.f,this.p]);
      this.skill_mapping.push(["sk_fdfp"]);
      this.skill_array.push([this.d,this.f,this.p_l]);
      this.skill_mapping.push(["sk_dfpl"]);
      this.skill_array.push([this.d,this.f,this.p]);
      this.skill_mapping.push(["sk_dfp"]);
      this.skill_array.push([this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_beike"]);
      this.skill_array.push([this.d,this.b,this.k_l]);
      this.skill_mapping.push(["sk_dbk_l"]);
      this.skill_array.push([this.d,this.b,this.k]);
      this.skill_mapping.push(["sk_dbk"]);
      this.skill_array.push([this.d,this.f,this.b,this.b,this.k_l]);
      this.skill_mapping.push(["kick4"]);
      this.skill_array.push([this.d,this.f,this.b,this.b,this.k]);
      this.skill_mapping.push(["kick5"]);
      this.skill_array.push([this.d,this.f,this.u,this.k_l]);
      this.skill_mapping.push(["kick4"]);
      this.skill_array.push([this.d,this.f,this.u,this.k]);
      this.skill_mapping.push(["kick5"]);
      this.skill_array.push([this.d,this.f,this.k_l]);
      this.skill_mapping.push(["kick4"]);
      this.skill_array.push([this.d,this.f,this.k]);
      this.skill_mapping.push(["kick5"]);
   }
   function skill_code_easy()
   {
      this.skill_array.push([this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_bingdian"]);
      this.skill_array.push([this.d,this.f,this.p_l]);
      this.skill_mapping.push(["sk_fdfp_l"]);
      this.skill_array.push([this.d,this.f,this.p]);
      this.skill_mapping.push(["sk_fdfp"]);
      this.skill_array.push([this.f,this.p_l]);
      this.skill_mapping.push(["sk_dfpl"]);
      this.skill_array.push([this.f,this.p]);
      this.skill_mapping.push(["sk_dfp"]);
      this.skill_array.push([this.b,this.p]);
      this.skill_mapping.push(["sk_beike"]);
      this.skill_array.push([this.b,this.k_l]);
      this.skill_mapping.push(["sk_dbk_l"]);
      this.skill_array.push([this.b,this.k]);
      this.skill_mapping.push(["sk_dbk"]);
      this.skill_array.push([this.d,this.s]);
      this.skill_mapping.push(["sk_tibing"]);
      this.skill_array.push([this.f,this.k_l]);
      this.skill_mapping.push(["kick4"]);
      this.skill_array.push([this.f,this.k]);
      this.skill_mapping.push(["kick5"]);
   }
}
