_level0.transIn();
var hasRandom = false;
var hasRandomNormal = false;
hasRandom = _level0.ranCharSelect || _level0.ranCharSelectNum2 || _level0.ranCharSelectNum3;
hasRandomNormal = _level0.ranCharSelectN || _level0.ranCharSelectNNum2 || _level0.ranCharSelectNNum3;
if(_level0.moreVs3V3 == true)
{
   var role = new Array();
   if(_level0.ranCharSelect)
   {
      role.push("random");
   }
   else if(_level0.ranCharSelectN)
   {
      role.push("randomNormal");
   }
   else
   {
      role.push(_level0.charSelect_P1 + _root.mode_role_P1);
   }
   if(_level0.ranCharSelectNum2)
   {
      role.push("random");
   }
   else if(_level0.ranCharSelectNNum2)
   {
      role.push("randomNormal");
   }
   else
   {
      role.push(_level0.charSelect_P12 + _root.mode_role_P12);
   }
   if(_level0.ranCharSelectNum3)
   {
      role.push("random");
   }
   else if(_level0.ranCharSelectNNum3)
   {
      role.push("randomNormal");
   }
   else
   {
      role.push(_level0.charSelect_P13 + _root.mode_role_P13);
   }
   _level0.sortRank(txt_name.text,role.toString(),undefined,3);
}
else if(_level0.moreVs == true)
{
   var role = new Array();
   if(_level0.ranCharSelect)
   {
      role.push("random");
   }
   else if(_level0.ranCharSelectN)
   {
      role.push("randomNormal");
   }
   else
   {
      role.push(_level0.charSelect_P1 + _root.mode_role_P1);
   }
   if(_level0.ranCharSelectNum2)
   {
      role.push("random");
   }
   else if(_level0.ranCharSelectNNum2)
   {
      role.push("randomNormal");
   }
   else
   {
      role.push(_level0.charSelect_P12 + _root.mode_role_P12);
   }
   _level0.sortRank(txt_name.text,role.toString(),undefined,2);
}
else if(hasRandom)
{
   _level0.sortRank(txt_name.text,"random",undefined,1);
}
else if(hasRandomNormal)
{
   _level0.sortRank(txt_name.text,"randomNormal",undefined,1);
}
else
{
   _level0.sortRank(txt_name.text,_root.charSelect_P1,_root.mode_role_P1,1);
}
