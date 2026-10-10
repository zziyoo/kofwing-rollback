class Type2_Igniz_Player extends Type2_Igniz_role
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
   function Type2_Igniz_Player()
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
      this.skill_mapping.push(["sk_dbo_ex"]);
      this.skill_array.push([this.d,this.f,this.s]);
      this.skill_mapping.push(["sk_dfo_ex"]);
      this.skill_array.push([this.d,this.f,this.d,this.f,this.p_l]);
      this.skill_mapping.push(["sk_dfdfpl_ex"]);
      this.skill_array.push([this.d,this.f,this.d,this.f,this.p]);
      this.skill_mapping.push(["sk_dfdfp_ex"]);
      this.skill_array.push([this.d,this.f,this.d,this.f,this.k]);
      this.skill_mapping.push(["sk_dfdfk_ex"]);
      this.skill_array.push([this.b,this.f,this.b,this.d,this.f,this.p]);
      this.skill_mapping.push(["sk_bfbdf_ex"]);
      this.skill_array.push([this.b,this.d,this.f,this.p_l]);
      this.skill_mapping.push(["sk_bdfpl_ex"]);
      this.skill_array.push([this.b,this.d,this.f,this.p]);
      this.skill_mapping.push(["sk_bdfp_ex"]);
      this.skill_array.push([this.f,this.d,this.f,this.p_l]);
      this.skill_mapping.push(["sk_fdfpl_ex"]);
      this.skill_array.push([this.f,this.d,this.f,this.p]);
      this.skill_mapping.push(["sk_fdfp_ex"]);
      this.skill_array.push([this.b,this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_bdbp_ex"]);
      this.skill_array.push([this.b,this.d,this.b,this.k]);
      this.skill_mapping.push(["sk_bdbk_ex"]);
      this.skill_array.push([this.f,this.d,this.b,this.p_l]);
      this.skill_mapping.push(["sk_fdbpl_ex"]);
      this.skill_array.push([this.f,this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_fdbp_ex"]);
      this.skill_array.push([this.f,this.d,this.b,this.k_l]);
      this.skill_mapping.push(["sk_fdbkl_ex"]);
      this.skill_array.push([this.f,this.d,this.b,this.k]);
      this.skill_mapping.push(["sk_fdbk_ex"]);
      this.skill_array.push([this.d,this.f,this.p_l]);
      this.skill_mapping.push(["sk_dfpl_ex"]);
      this.skill_array.push([this.d,this.f,this.p]);
      this.skill_mapping.push(["sk_dfp_ex"]);
      this.skill_array.push([this.d,this.f,this.k_l]);
      this.skill_mapping.push(["sk_dfkl_ex"]);
      this.skill_array.push([this.d,this.f,this.k]);
      this.skill_mapping.push(["sk_dfk_ex"]);
      this.skill_array.push([this.d,this.b,this.p_l]);
      this.skill_mapping.push(["sk_dbpl_ex"]);
      this.skill_array.push([this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_dbp_ex"]);
      this.skill_array.push([this.d,this.b,this.k_l]);
      this.skill_mapping.push(["sk_dbkl_ex"]);
      this.skill_array.push([this.d,this.b,this.k]);
      this.skill_mapping.push(["sk_dbk_ex"]);
   }
   function skill_code_easy()
   {
      this.skill_array.push([this.d,this.b,this.p_l]);
      this.skill_mapping.push(["sk_dfdfpl_ex"]);
      this.skill_array.push([this.b,this.f,this.p_l]);
      this.skill_mapping.push(["sk_bdfpl_ex"]);
      this.skill_array.push([this.b,this.f,this.p]);
      this.skill_mapping.push(["sk_bdfp_ex"]);
      this.skill_array.push([this.d,this.b,this.k]);
      this.skill_mapping.push(["sk_bdbk_ex"]);
      this.skill_array.push([this.b,this.f,this.k_l]);
      this.skill_mapping.push(["sk_bfbdf_ex"]);
      this.skill_array.push([this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_bdbp_ex"]);
      this.skill_array.push([this.d,this.f,this.p_l]);
      this.skill_mapping.push(["sk_fdfpl_ex"]);
      this.skill_array.push([this.d,this.f,this.p]);
      this.skill_mapping.push(["sk_fdfp_ex"]);
      this.skill_array.push([this.f,this.b,this.p_l]);
      this.skill_mapping.push(["sk_fdbpl_ex"]);
      this.skill_array.push([this.f,this.b,this.p]);
      this.skill_mapping.push(["sk_fdbp_ex"]);
      this.skill_array.push([this.f,this.b,this.k_l]);
      this.skill_mapping.push(["sk_fdbkl_ex"]);
      this.skill_array.push([this.f,this.b,this.k]);
      this.skill_mapping.push(["sk_fdbk_ex"]);
      this.skill_array.push([this.b,this.p_l]);
      this.skill_mapping.push(["sk_dbpl_ex"]);
      this.skill_array.push([this.b,this.p]);
      this.skill_mapping.push(["sk_dbp_ex"]);
      this.skill_array.push([this.b,this.k_l]);
      this.skill_mapping.push(["sk_dbkl_ex"]);
      this.skill_array.push([this.b,this.k]);
      this.skill_mapping.push(["sk_dbk_ex"]);
      this.skill_array.push([this.f,this.k_l]);
      this.skill_mapping.push(["sk_dfkl_ex"]);
      this.skill_array.push([this.f,this.k]);
      this.skill_mapping.push(["sk_dfk_ex"]);
      this.skill_array.push([this.f,this.p_l]);
      this.skill_mapping.push(["sk_dfpl_ex"]);
      this.skill_array.push([this.f,this.p]);
      this.skill_mapping.push(["sk_dfp_ex"]);
   }
}
