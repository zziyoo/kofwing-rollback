function defaultKey()
{
   _level0.key_P1[0] = {u:87,d:83,b:65,f:68,p:74,k:75,p_l:85,k_l:73,s:79,s2:76,h:84,qq:80};
   _level0.key_P2[0] = {u:38,d:40,b:37,f:39,p:97,k:98,p_l:100,k_l:101,s:102,s2:99,h:96,qq:103};
   loadKey();
   _level0.setKey();
}
function loadKey()
{
   var _loc5_ = _level0.key_P1;
   var _loc4_ = _level0.key_P2;
   var _loc2_;
   var _loc3_;
   for(var _loc6_ in _loc5_[0])
   {
      _loc2_ = _loc5_[0][_loc6_];
      _loc3_ = keyName(_loc2_);
      this[_loc6_].label = _loc3_;
   }
   for(_loc6_ in _loc4_[0])
   {
      _loc2_ = _loc4_[0][_loc6_];
      _loc3_ = keyName(_loc2_);
      this[_loc6_ + "_2"].label = _loc3_;
   }
}
function setKey(p, k)
{
   player = p;
   key = k;
   gotoAndStop("set");
}
function pressKey(code)
{
   var _loc2_ = keyName(code);
   if(_loc2_ == "")
   {
      gotoAndStop("alert1");
      return undefined;
   }
   if(player == "P1")
   {
      _level0.key_P1[0][key] = code;
      _level0[key] = code;
      this[key].label = _loc2_;
   }
   else if(player == "P2")
   {
      _level0.key_P2[0][key] = code;
      _level0[key + "_2"] = code;
      this[key + "_2"].label = _loc2_;
   }
   gotoAndStop("wait");
}
function checkKey(player, code)
{
   var _loc1_ = _level0["key_" + player][0];
   for(var _loc3_ in _loc1_)
   {
      if(_loc1_[_loc3_] == code)
      {
         return true;
      }
   }
}
function keyName(key)
{
   switch(key)
   {
      case 32:
         keycode = "BP";
         break;
      case 65:
         keycode = "A";
         break;
      case 66:
         keycode = "B";
         break;
      case 67:
         keycode = "C";
         break;
      case 68:
         keycode = "D";
         break;
      case 69:
         keycode = "E";
         break;
      case 70:
         keycode = "F";
         break;
      case 71:
         keycode = "G";
         break;
      case 72:
         keycode = "H";
         break;
      case 73:
         keycode = "I";
         break;
      case 74:
         keycode = "J";
         break;
      case 75:
         keycode = "K";
         break;
      case 76:
         keycode = "L";
         break;
      case 77:
         keycode = "M";
         break;
      case 78:
         keycode = "N";
         break;
      case 79:
         keycode = "O";
         break;
      case 80:
         keycode = "P";
         break;
      case 81:
         keycode = "Q";
         break;
      case 82:
         keycode = "R";
         break;
      case 83:
         keycode = "S";
         break;
      case 84:
         keycode = "T";
         break;
      case 85:
         keycode = "U";
         break;
      case 86:
         keycode = "V";
         break;
      case 87:
         keycode = "W";
         break;
      case 88:
         keycode = "X";
         break;
      case 89:
         keycode = "Y";
         break;
      case 90:
         keycode = "Z";
         break;
      case 96:
         keycode = "0";
         break;
      case 97:
         keycode = "1";
         break;
      case 98:
         keycode = "2";
         break;
      case 99:
         keycode = "3";
         break;
      case 100:
         keycode = "4";
         break;
      case 101:
         keycode = "5";
         break;
      case 102:
         keycode = "6";
         break;
      case 103:
         keycode = "7";
         break;
      case 104:
         keycode = "8";
         break;
      case 105:
         keycode = "9";
         break;
      case 110:
         keycode = ".";
         break;
      case 36:
         keycode = "Home";
         break;
      case 35:
         keycode = "End";
         break;
      case 46:
         keycode = "Delete";
         break;
      case 34:
         keycode = "PageDown";
         break;
      case 37:
         keycode = "←";
         break;
      case 38:
         keycode = "↑";
         break;
      case 39:
         keycode = "→";
         break;
      case 40:
         keycode = "↓";
         break;
      case 186:
         keycode = "；";
         break;
      case 48:
         keycode = "0";
         break;
      case 49:
         keycode = "1";
         break;
      case 50:
         keycode = "2";
         break;
      case 51:
         keycode = "3";
         break;
      case 52:
         keycode = "4";
         break;
      case 53:
         keycode = "5";
         break;
      case 54:
         keycode = "6";
         break;
      case 55:
         keycode = "7";
         break;
      case 56:
         keycode = "8";
         break;
      case 57:
         keycode = "9";
         break;
      case 188:
         keycode = "，";
         break;
      case 190:
         keycode = ".";
         break;
      case 222:
         keycode = "\'";
         break;
      case 191:
         keycode = "/";
         break;
      case 219:
         keycode = "[";
         break;
      case 221:
         keycode = "]";
         break;
      case 220:
         keycode = "|";
         break;
      case 189:
         keycode = "-";
         break;
      case 187:
         keycode = "=";
         break;
      case 192:
         keycode = "`";
         break;
      default:
         keycode = "";
   }
   return keycode;
}
var player;
var key;
