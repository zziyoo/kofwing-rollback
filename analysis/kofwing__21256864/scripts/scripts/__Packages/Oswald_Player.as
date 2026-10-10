class Oswald_Player extends Oswald_role
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
   function Oswald_Player()
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
      this.skill_mapping.push(["sk_max3"]);
      this.skill_array.push([this.d,this.f,this.s]);
      this.skill_mapping.push(["sk_max2"]);
      this.skill_array.push([this.f,this.d,this.b,this.f,this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_s1"]);
      this.skill_array.push([this.f,this.b,this.f,this.b,this.p]);
      this.skill_mapping.push(["sk_s1"]);
      this.skill_array.push([this.d,this.b,this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_s1"]);
      this.skill_array.push([this.d,this.f,this.d,this.b,this.p_l]);
      this.skill_mapping.push(["sk_s2_l"]);
      this.skill_array.push([this.d,this.f,this.b,this.p_l]);
      this.skill_mapping.push(["sk_s2_l"]);
      this.skill_array.push([this.d,this.f,this.d,this.b,this.p]);
      this.skill_mapping.push(["sk_s2"]);
      this.skill_array.push([this.d,this.f,this.b,this.p]);
      this.skill_mapping.push(["sk_s2"]);
      this.skill_array.push([this.f,this.d,this.f,this.p_l]);
      this.skill_mapping.push(["QA"]);
      this.skill_array.push([this.f,this.d,this.f,this.p]);
      this.skill_mapping.push(["QC"]);
      this.skill_array.push([this.f,this.d,this.f,this.k_l]);
      this.skill_mapping.push(["QB"]);
      this.skill_array.push([this.f,this.d,this.f,this.k]);
      this.skill_mapping.push(["QD"]);
      this.skill_array.push([this.b,this.d,this.b,this.k_l]);
      this.skill_mapping.push(["K_l"]);
      this.skill_array.push([this.b,this.d,this.b,this.k]);
      this.skill_mapping.push(["K"]);
      this.skill_array.push([this.d,this.f,this.p_l]);
      this.skill_mapping.push(["fang_l"]);
      this.skill_array.push([this.d,this.f,this.p]);
      this.skill_mapping.push(["fang"]);
      this.skill_array.push([this.d,this.b,this.p_l]);
      this.skill_mapping.push(["heit_l"]);
      this.skill_array.push([this.d,this.b,this.p]);
      this.skill_mapping.push(["heit"]);
      this.skill_array.push([this.d,this.f,this.k_l]);
      this.skill_mapping.push(["hong_l"]);
      this.skill_array.push([this.d,this.f,this.k]);
      this.skill_mapping.push(["hong"]);
      this.skill_array.push([this.d,this.b,this.k_l]);
      this.skill_mapping.push(["mei_l"]);
      this.skill_array.push([this.d,this.b,this.k]);
      this.skill_mapping.push(["mei"]);
      this.skill_array.push([this.d,this.f,this.qq]);
      this.skill_mapping.push(["A"]);
      this.skill_array.push([this.d,this.b,this.qq]);
      this.skill_mapping.push(["A"]);
   }
   function skill_code_easy()
   {
      this.skill_array.push([this.d,this.b,this.p_l]);
      this.skill_mapping.push(["sk_s2_l"]);
      this.skill_array.push([this.d,this.f,this.p_l]);
      this.skill_mapping.push(["QA"]);
      this.skill_array.push([this.d,this.f,this.p]);
      this.skill_mapping.push(["QC"]);
      this.skill_array.push([this.d,this.f,this.k_l]);
      this.skill_mapping.push(["QB"]);
      this.skill_array.push([this.d,this.f,this.k]);
      this.skill_mapping.push(["QD"]);
      this.skill_array.push([this.d,this.b,this.k_l]);
      this.skill_mapping.push(["K_l"]);
      this.skill_array.push([this.d,this.b,this.k]);
      this.skill_mapping.push(["K"]);
      this.skill_array.push([this.f,this.p_l]);
      this.skill_mapping.push(["fang_l"]);
      this.skill_array.push([this.f,this.p]);
      this.skill_mapping.push(["fang"]);
      this.skill_array.push([this.b,this.p_l]);
      this.skill_mapping.push(["heit_l"]);
      this.skill_array.push([this.b,this.p]);
      this.skill_mapping.push(["heit"]);
      this.skill_array.push([this.f,this.k_l]);
      this.skill_mapping.push(["hong_l"]);
      this.skill_array.push([this.f,this.k]);
      this.skill_mapping.push(["hong"]);
      this.skill_array.push([this.b,this.k_l]);
      this.skill_mapping.push(["mei_l"]);
      this.skill_array.push([this.b,this.k]);
      this.skill_mapping.push(["mei"]);
      this.skill_array.push([this.f,this.qq]);
      this.skill_mapping.push(["A"]);
      this.skill_array.push([this.b,this.qq]);
      this.skill_mapping.push(["A"]);
   }
}
