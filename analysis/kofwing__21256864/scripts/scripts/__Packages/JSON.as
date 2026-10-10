class JSON extends Object
{
   static var pos = 0;
   function JSON()
   {
      super();
   }
   static function isDigit(ch)
   {
      return ch >= "0" && ch <= "9" || ch == "+" || ch == "-" || ch == ".";
   }
   static function isHexDigit(ch)
   {
      return JSON.isDigit(ch) || ch >= "A" && ch <= "F" || ch >= "a" && ch <= "f";
   }
   static function toTrue(str, from, to)
   {
      JSON.pos = from + 3;
      return true;
   }
   static function toFalse(str, from, to)
   {
      JSON.pos = from + 4;
      return false;
   }
   static function toNull(str, from, to)
   {
      JSON.pos = from + 3;
      return null;
   }
   static function toNAN(str, from, to)
   {
      JSON.pos = from + 2;
      return NaN;
   }
   static function toNumber(str, from, to)
   {
      var _loc1_ = from + 1;
      var _loc2_;
      while(_loc1_ <= to)
      {
         _loc2_ = str.charAt(_loc1_);
         if(!JSON.isDigit(_loc2_))
         {
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
      var _loc5_ = Number(str.substring(from,_loc1_));
      if(!isFinite(_loc5_))
      {
         throw {msg:"json格式错误，不正确的数字, 错误位置:" + from};
      }
      JSON.pos = _loc1_ - 1;
      return _loc5_;
   }
   static function unescapeString(str)
   {
      var _loc1_ = 0;
      var _loc5_ = "";
      var _loc3_;
      var _loc6_;
      var _loc2_;
      while(_loc1_ < str.length)
      {
         _loc3_ = str.charAt(_loc1_);
         if(_loc3_ == "\\")
         {
            if(_loc1_ + 5 < str.length && str.charAt(_loc1_ + 1) == "u")
            {
               _loc6_ = "";
               _loc2_ = _loc1_ + 2;
               while(_loc2_ < _loc1_ + 6)
               {
                  _loc3_ = str.charAt(_loc2_);
                  if(!JSON.isHexDigit(_loc3_))
                  {
                     throw {msg:"json格式错误，字符串unicode编码转换错误，错误位置:" + _loc2_};
                  }
                  _loc6_ += _loc3_;
                  _loc2_ = _loc2_ + 1;
               }
               _loc5_ += String.fromCharCode(parseInt(_loc6_,16));
               _loc1_ += 5;
            }
            else
            {
               _loc5_ += _loc3_;
            }
         }
         else
         {
            _loc5_ += _loc3_;
         }
         _loc1_ += 1;
      }
      return _loc5_;
   }
   static function toStr(str, from, to)
   {
      var _loc3_ = false;
      var _loc1_ = from + 1;
      var _loc2_;
      while(_loc1_ <= to)
      {
         _loc2_ = str.charAt(_loc1_);
         if(!_loc3_)
         {
            if(_loc2_ == "\"")
            {
               JSON.pos = _loc1_;
               return JSON.unescapeString(str.substring(from + 1,_loc1_));
            }
            if(_loc2_ == "\\")
            {
               _loc3_ = true;
            }
         }
         else
         {
            _loc3_ = false;
         }
         _loc1_ = _loc1_ + 1;
      }
      throw {msg:"json格式错误，字符串没有找到结尾, 错误位置:" + from};
   }
   static function toArray(str, from, to)
   {
      var _loc1_ = [];
      JSON.pos = from + 1;
      var _loc4_;
      while(JSON.pos <= to)
      {
         _loc4_ = str.charAt(JSON.pos);
         switch(_loc4_)
         {
            case "\"":
               _loc1_.push(JSON.toStr(str,JSON.pos,to));
               break;
            case "[":
               _loc1_.push(JSON.toArray(str,JSON.pos,to));
               break;
            case "{":
               _loc1_.push(JSON.toObject(str,JSON.pos,to));
               break;
            case "]":
               return _loc1_;
            case "f":
               _loc1_.push(JSON.toFalse(str,JSON.pos,to));
               break;
            case "F":
               _loc1_.push(JSON.toFalse(str,JSON.pos,to));
               break;
            case "t":
               _loc1_.push(JSON.toTrue(str,JSON.pos,to));
               break;
            case "T":
               _loc1_.push(JSON.toTrue(str,JSON.pos,to));
               break;
            case "n":
               _loc1_.push(JSON.toNull(str,JSON.pos,to));
               break;
            case "N":
               _loc1_.push(JSON.toNAN(str,JSON.pos,to));
               break;
            default:
               if(JSON.isDigit(_loc4_))
               {
                  _loc1_.push(JSON.toNumber(str,JSON.pos,to));
               }
         }
         JSON.pos += 1;
      }
      throw {msg:"json格式错误，表没有找到结尾, 错误位置:" + from};
   }
   static function toObject(str, from, to)
   {
      var _loc4_ = {};
      var _loc1_;
      JSON.pos = from + 1;
      var _loc6_;
      while(JSON.pos <= to)
      {
         _loc6_ = str.charAt(JSON.pos);
         switch(_loc6_)
         {
            case "\"":
               if(!_loc1_)
               {
                  _loc1_ = JSON.toStr(str,JSON.pos,to);
               }
               else
               {
                  _loc4_[_loc1_] = JSON.toStr(str,JSON.pos,to);
                  _loc1_ = null;
               }
               break;
            case "[":
               if(!_loc1_)
               {
                  _loc1_ = JSON.toArray(str,JSON.pos,to);
               }
               else
               {
                  _loc4_[_loc1_] = JSON.toArray(str,JSON.pos,to);
                  _loc1_ = null;
               }
               break;
            case "{":
               if(!_loc1_)
               {
                  _loc1_ = JSON.toObject(str,JSON.pos,to);
               }
               else
               {
                  _loc4_[_loc1_] = JSON.toObject(str,JSON.pos,to);
                  _loc1_ = null;
               }
               break;
            case "}":
               return _loc4_;
            case "]":
               return _loc4_;
            case "f":
               if(!_loc1_)
               {
                  throw {msg:"json格式错误，boolean不能做key, 错误位置:" + from};
               }
               _loc4_[_loc1_] = JSON.toFalse(str,JSON.pos,to);
               break;
            case "F":
               if(!_loc1_)
               {
                  throw {msg:"json格式错误，boolean不能做key, 错误位置:" + from};
               }
               _loc4_[_loc1_] = JSON.toFalse(str,JSON.pos,to);
               break;
            case "t":
               if(!_loc1_)
               {
                  throw {msg:"json格式错误，boolean不能做key, 错误位置:" + from};
               }
               _loc4_[_loc1_] = JSON.toTrue(str,JSON.pos,to);
            case "T":
               if(!_loc1_)
               {
                  throw {msg:"json格式错误，boolean不能做key, 错误位置:" + from};
               }
               _loc4_[_loc1_] = JSON.toTrue(str,JSON.pos,to);
               break;
            case "n":
               if(!_loc1_)
               {
                  throw {msg:"json格式错误，null不能做key, 错误位置:" + from};
               }
               _loc4_[_loc1_] = JSON.toNull(str,JSON.pos,to);
               break;
            case "N":
               if(!_loc1_)
               {
                  throw {msg:"json格式错误，nan不能做key, 错误位置:" + from};
               }
               _loc4_[_loc1_] = JSON.toNAN(str,JSON.pos,to);
               break;
            default:
               if(JSON.isDigit(_loc6_))
               {
                  if(!_loc1_)
                  {
                     _loc1_ = JSON.toNumber(str,JSON.pos,to);
                  }
                  else
                  {
                     _loc4_[_loc1_] = JSON.toNumber(str,JSON.pos,to);
                     _loc1_ = null;
                  }
               }
         }
         JSON.pos += 1;
      }
      throw {msg:"json格式错误，表没有找到结尾, 错误位置:}" + from};
   }
   static function decode(str)
   {
      JSON.pos = 0;
      if(str == "")
      {
         return null;
      }
      var _loc2_ = str.charAt(JSON.pos);
      switch(_loc2_)
      {
         case "\"":
            return JSON.toStr(str,JSON.pos,str.length - 1);
         case "[":
            return JSON.toArray(str,JSON.pos,str.length - 1);
         case "{":
            return JSON.toObject(str,JSON.pos,str.length - 1);
         case "f":
            return false;
         case "F":
            return false;
         case "t":
            return true;
         case "n":
            return null;
         case "N":
            return NaN;
         case "T":
            return true;
         default:
            if(JSON.isDigit(_loc2_))
            {
               return JSON.toNumber(str,JSON.pos,str.length - 1);
            }
            return;
      }
   }
}
