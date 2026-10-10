keyp.pressFunc = function()
{
   _parent.status_1 = "punch";
   _parent.status_3 = "attack";
   _parent.nozhuijia = false;
   _parent.checkSide_abs();
   _parent.skill_start("punch");
};
