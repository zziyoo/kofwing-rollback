function checkGetChar()
{
   return false;
}
function checkExist_pass(char)
{
   var _loc1_;
   for(var _loc3_ in passChar)
   {
      _loc1_ = passChar[_loc3_];
      if(char == _loc1_)
      {
         return true;
      }
   }
}
function checkExist_hidden(char)
{
   var _loc1_;
   for(var _loc3_ in _level0.hiddenCharArray)
   {
      _loc1_ = _level0.hiddenCharArray[_loc3_];
      if(char == _loc1_)
      {
         return true;
      }
   }
}
stop();
var char = _level0.charSelect_P1;
var charName = char + "_" + _level0.mode_role_P1.toString();
var passChar = _level0.passChar;
if(_level0.passChar == undefined)
{
   passChar = new Array();
}
passChar.push(charName);
_level0.passChar = passChar;
_level0.saveFunc("passChar",passChar);
var secretChar = ["Iori3","Orochi","Igniz","Rugal","Czero"];
var passIori3 = _level0.passIori3;
var passOrochi = _level0.passOrochi;
var passIgniz = _level0.passIgniz;
var passRugal = _level0.passRugal;
var passCzero = _level0.passCzero;
if(!passOrochi && (checkExist_pass("Kyo_1") || checkExist_pass("Kyo_2")) && (checkExist_pass("Iori_1") || checkExist_pass("Iori_2")))
{
   _level0.passOrochi = true;
   gotoAndStop("Orochi");
}
if(!passIori3 && checkExist_pass("Iori_1") && checkExist_pass("Iori_2"))
{
   _level0.passIori3 = true;
   gotoAndStop("Iori3");
}
if(!passIgniz && (checkExist_pass("K_1") || checkExist_pass("K_2")) && (checkExist_pass("Kula_1") || checkExist_pass("Kula_2")))
{
   _level0.passIgniz = true;
   gotoAndStop("Igniz");
}
if(!passRugal)
{
   _level0.passRugal = true;
   gotoAndStop("Rugal");
}
var i = 0;
while(i < secretChar.length)
{
   _level0.saveFunc("pass" + secretChar[i],_level0["pass" + secretChar[i]]);
   i++;
}
return undefined;
