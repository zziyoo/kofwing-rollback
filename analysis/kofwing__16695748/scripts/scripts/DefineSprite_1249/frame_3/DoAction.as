var sanlian = false;
if(_parent.opp.status_2 == "land" && _parent.opp.status_7 == "long2")
{
   sanlian = true;
}
this.onEnterFrame = function()
{
   if(sanlian == true && _parent.onHit == true)
   {
      delete this.onEnterFrame;
      _parent.switchSkill("sk_sanlian");
   }
   if(_parent.player_type == "cpu")
   {
      _parent.long_re_attack_check();
   }
};
