if(_level0.autoPlayGame)
{
   showAuto._visible = true;
}
else
{
   showAuto._visible = false;
}
if(_level0.player_type == "1PVSCOM" && ((_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8) && _level0.moreVs3V3 != true || (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6) && _level0.moreVs3V3 == true) || _level0.moreVs != true)
{
   name_p2._x = 676;
   face_p2._x = 636;
}
else
{
   name_p2._x = 582;
   face_p2._x = 541;
}
var namep12_x;
var namep13_x;
var namep22_x;
var namep2_x;
var name_p23_x;
var face_p1_x;
var face_p12_x;
var face_p13_x;
var face_p2_x;
var face_p22_x;
var face_p23_x;
var order1P_1_x;
var order1P_2_x;
var order1P_3_x;
var order2P_1_x;
var order2P_2_x;
var order2P_3_x;
name_p12_x = name_p12._x;
name_p1_x = name_p1._x;
name_p13_x = name_p13._x;
name_p22_x = name_p22._x;
name_p2_x = name_p2._x;
name_p23_x = name_p23._x;
face_p1_x = face_p1._x;
face_p12_x = face_p12._x;
face_p13_x = face_p13._x;
face_p2_x = face_p2._x;
face_p22_x = face_p22._x;
face_p23_x = face_p23._x;
order1P_1_x = order1P_1._x;
order1P_2_x = order1P_2._x;
order1P_3_x = order1P_3._x;
order2P_1_x = order2P_1._x;
order2P_2_x = order2P_2._x;
order2P_3_x = order2P_3._x;
if(_level0.moreVs3V3 != true)
{
   name_p12._x = name_p13_x;
   order1P_2._x = order1P_3_x;
   face_p12._x = face_p13_x;
   name_p22._x = name_p23_x;
   face_p22._x = face_p23_x;
   order2P_2._x = order2P_3_x;
}
var orderKey = {};
_level0.orderNum_p1 = 0;
_level0.orderNum_p2 = 0;
order1P_1.gotoAndStop("numA");
order1P_2.gotoAndStop("numB");
order1P_3.gotoAndStop("numC");
order2P_1.gotoAndStop("numA");
order2P_2.gotoAndStop("numB");
order2P_3.gotoAndStop("numC");
if(_level0.moreVs == true && _level0.moreVs3V3 != true)
{
   order1P_3.gotoAndStop("none");
   order2P_3.gotoAndStop("none");
}
if(_level0.moreVs != true)
{
   order1P_1.gotoAndStop("none");
   order1P_2.gotoAndStop("none");
   order1P_3.gotoAndStop("none");
   order2P_1.gotoAndStop("none");
   order2P_2.gotoAndStop("none");
   order2P_3.gotoAndStop("none");
}
if(_level0.moreVs3V3 == true && _level0.player_type == "1PVSCOM" && (_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6))
{
   order2P_1.gotoAndStop("none");
   order2P_2.gotoAndStop("none");
   order2P_3.gotoAndStop("none");
}
else if(_level0.moreVs == true && _level0.player_type == "1PVSCOM" && (_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8))
{
   order2P_1.gotoAndStop("none");
   order2P_2.gotoAndStop("none");
   order2P_3.gotoAndStop("none");
}
var order_rate = Math.random();
if(_level0.moreVs == true)
{
   if(_level0.moreVs3V3 == true)
   {
      _level0.orderMax = 4;
      _level0.firstNum1P = 0;
      _level0.firstNum2P = 0;
      if(_level0.player_type == "1PVSCOM" && !(_level0.stageID == 2 || _level0.stageID == 5 || _level0.stageID == 6))
      {
         orderKey.p_l2 = true;
         orderKey.k_l2 = true;
         orderKey.p2 = true;
         setTimeout(function()
         {
            _level0.orderNum_p2 = 2;
            if(order_rate > 0.25)
            {
               if(order_rate <= 0.5)
               {
                  _level0.charSelect_P2 = _level0.selectOrderListP2[1].name;
                  _level0.mode_role_P2 = _level0.selectOrderListP2[1].type;
                  _level0.charSelect_P22 = _level0.selectOrderListP2[0].name;
                  _level0.mode_role_P22 = _level0.selectOrderListP2[0].type;
                  _level0.charSelect_P23 = _level0.selectOrderListP2[2].name;
                  _level0.mode_role_P23 = _level0.selectOrderListP2[2].type;
               }
               else if(order_rate <= 0.75)
               {
                  _level0.charSelect_P2 = _level0.selectOrderListP2[2].name;
                  _level0.mode_role_P2 = _level0.selectOrderListP2[2].type;
                  _level0.charSelect_P22 = _level0.selectOrderListP2[0].name;
                  _level0.mode_role_P22 = _level0.selectOrderListP2[0].type;
                  _level0.charSelect_P23 = _level0.selectOrderListP2[1].name;
                  _level0.mode_role_P23 = _level0.selectOrderListP2[1].type;
               }
               else
               {
                  _level0.charSelect_P2 = _level0.selectOrderListP2[2].name;
                  _level0.mode_role_P2 = _level0.selectOrderListP2[2].type;
                  _level0.charSelect_P22 = _level0.selectOrderListP2[1].name;
                  _level0.mode_role_P22 = _level0.selectOrderListP2[1].type;
                  _level0.charSelect_P23 = _level0.selectOrderListP2[0].name;
                  _level0.mode_role_P23 = _level0.selectOrderListP2[0].type;
               }
            }
            order2P_1.gotoAndStop("num1");
            order2P_2.gotoAndStop("num2");
            order2P_3.gotoAndStop("num3");
            _level0.ok_snd.start();
            _level0.ok_snd.start();
            initFaceName();
         }
         ,500);
      }
      this.onEnterFrame = function()
      {
         if(_level0.orderMax == _level0.orderNum_p1 + _level0.orderNum_p2)
         {
            return undefined;
         }
         if(Key.isDown(_level0.p_l) && _level0.orderNum_p1 == 0)
         {
            if(orderKey.p_l == true)
            {
               return undefined;
            }
            orderKey.p_l = true;
            _level0.orderNum_p1++;
            o;
            _level0.charSelect_P1 = _level0.selectOrderListP1[0].name;
            _level0.mode_role_P1 = _level0.selectOrderListP1[0].type;
            _level0.firstNum1P = 1;
            _level0.ok_snd.start();
         }
         if(Key.isDown(_level0.p_l) && _level0.orderNum_p1 == 1)
         {
            if(orderKey.p_l == true)
            {
               return undefined;
            }
            orderKey.p_l = true;
            _level0.orderNum_p1++;
            _level0.charSelect_P12 = _level0.selectOrderListP1[0].name;
            _level0.mode_role_P12 = _level0.selectOrderListP1[0].type;
            if(_level0.firstNum1P == 2)
            {
               _level0.charSelect_P13 = _level0.selectOrderListP1[2].name;
               _level0.mode_role_P13 = _level0.selectOrderListP1[2].type;
            }
            else if(_level0.firstNum1P == 3)
            {
               _level0.charSelect_P13 = _level0.selectOrderListP1[1].name;
               _level0.mode_role_P13 = _level0.selectOrderListP1[1].type;
            }
            _level0.ok_snd.start();
            initFaceName();
            order1P_1.gotoAndStop("num1");
            order1P_2.gotoAndStop("num2");
            order1P_3.gotoAndStop("num3");
         }
         if(Key.isDown(_level0.k_l) && _level0.orderNum_p1 == 0)
         {
            if(orderKey.k_l == true)
            {
               return undefined;
            }
            orderKey.k_l = true;
            _level0.orderNum_p1++;
            _level0.charSelect_P1 = _level0.selectOrderListP1[1].name;
            _level0.mode_role_P1 = _level0.selectOrderListP1[1].type;
            _level0.charSelect_P12 = _level0.selectOrderListP1[0].name;
            _level0.mode_role_P12 = _level0.selectOrderListP1[0].type;
            _level0.firstNum1P = 2;
            _level0.ok_snd.start();
         }
         if(Key.isDown(_level0.k_l) && _level0.orderNum_p1 == 1)
         {
            if(orderKey.k_l == true)
            {
               return undefined;
            }
            orderKey.k_l = true;
            _level0.orderNum_p1++;
            _level0.charSelect_P12 = _level0.selectOrderListP1[1].name;
            _level0.mode_role_P12 = _level0.selectOrderListP1[1].type;
            if(_level0.firstNum1P == 1)
            {
               _level0.charSelect_P13 = _level0.selectOrderListP1[2].name;
               _level0.mode_role_P13 = _level0.selectOrderListP1[2].type;
            }
            else if(_level0.firstNum1P == 3)
            {
               _level0.charSelect_P13 = _level0.selectOrderListP1[0].name;
               _level0.mode_role_P13 = _level0.selectOrderListP1[0].type;
            }
            _level0.ok_snd.start();
            initFaceName();
            order1P_1.gotoAndStop("num1");
            order1P_2.gotoAndStop("num2");
            order1P_3.gotoAndStop("num3");
         }
         if(Key.isDown(_level0.p) && _level0.orderNum_p1 == 0)
         {
            if(orderKey.p == true)
            {
               return undefined;
            }
            orderKey.p = true;
            _level0.orderNum_p1++;
            _level0.charSelect_P1 = _level0.selectOrderListP1[2].name;
            _level0.mode_role_P1 = _level0.selectOrderListP1[2].type;
            _level0.charSelect_P13 = _level0.selectOrderListP1[0].name;
            _level0.mode_role_P13 = _level0.selectOrderListP1[0].type;
            _level0.firstNum1P = 3;
            _level0.ok_snd.start();
         }
         if(Key.isDown(_level0.p) && _level0.orderNum_p1 == 1)
         {
            if(orderKey.p == true)
            {
               return undefined;
            }
            orderKey.p = true;
            _level0.orderNum_p1++;
            _level0.charSelect_P12 = _level0.selectOrderListP1[2].name;
            _level0.mode_role_P12 = _level0.selectOrderListP1[2].type;
            if(_level0.firstNum1P == 1)
            {
               _level0.charSelect_P13 = _level0.selectOrderListP1[1].name;
               _level0.mode_role_P13 = _level0.selectOrderListP1[1].type;
            }
            else if(_level0.firstNum1P == 2)
            {
               _level0.charSelect_P13 = _level0.selectOrderListP1[0].name;
               _level0.mode_role_P13 = _level0.selectOrderListP1[0].type;
            }
            _level0.ok_snd.start();
            initFaceName();
            order1P_1.gotoAndStop("num1");
            order1P_2.gotoAndStop("num2");
            order1P_3.gotoAndStop("num3");
         }
         if(Key.isDown(_level0.p_l2) && _level0.orderNum_p2 == 0)
         {
            if(orderKey.p_l2 == true)
            {
               return undefined;
            }
            orderKey.p_l2 = true;
            _level0.orderNum_p2++;
            _level0.charSelect_P2 = _level0.selectOrderListP2[0].name;
            _level0.mode_role_P2 = _level0.selectOrderListP2[0].type;
            _level0.firstNum2P = 1;
            _level0.ok_snd.start();
         }
         if(Key.isDown(_level0.p_l2) && _level0.orderNum_p2 == 1)
         {
            if(orderKey.p_l2 == true)
            {
               return undefined;
            }
            orderKey.p_l2 = true;
            _level0.orderNum_p2++;
            _level0.charSelect_P22 = _level0.selectOrderListP2[0].name;
            _level0.mode_role_P22 = _level0.selectOrderListP2[0].type;
            if(_level0.firstNum2P == 2)
            {
               _level0.charSelect_P23 = _level0.selectOrderListP2[2].name;
               _level0.mode_role_P23 = _level0.selectOrderListP2[2].type;
            }
            else if(_level0.firstNum2P == 3)
            {
               _level0.charSelect_P23 = _level0.selectOrderListP2[1].name;
               _level0.mode_role_P23 = _level0.selectOrderListP2[1].type;
            }
            _level0.ok_snd.start();
            initFaceName();
            order2P_1.gotoAndStop("num1");
            order2P_2.gotoAndStop("num2");
            order2P_3.gotoAndStop("num3");
         }
         if(Key.isDown(_level0.k_l2) && _level0.orderNum_p2 == 0)
         {
            if(orderKey.k_l2 == true)
            {
               return undefined;
            }
            orderKey.k_l2 = true;
            _level0.orderNum_p2++;
            _level0.charSelect_P2 = _level0.selectOrderListP2[1].name;
            _level0.mode_role_P2 = _level0.selectOrderListP2[1].type;
            _level0.charSelect_P22 = _level0.selectOrderListP2[0].name;
            _level0.mode_role_P22 = _level0.selectOrderListP2[0].type;
            _level0.firstNum2P = 2;
            _level0.ok_snd.start();
         }
         if(Key.isDown(_level0.k_l2) && _level0.orderNum_p2 == 1)
         {
            if(orderKey.k_l2 == true)
            {
               return undefined;
            }
            orderKey.k_l2 = true;
            _level0.orderNum_p2++;
            _level0.charSelect_P22 = _level0.selectOrderListP2[1].name;
            _level0.mode_role_P22 = _level0.selectOrderListP2[1].type;
            if(_level0.firstNum2P == 1)
            {
               _level0.charSelect_P23 = _level0.selectOrderListP2[2].name;
               _level0.mode_role_P23 = _level0.selectOrderListP2[2].type;
            }
            else if(_level0.firstNum2P == 3)
            {
               _level0.charSelect_P23 = _level0.selectOrderListP2[0].name;
               _level0.mode_role_P23 = _level0.selectOrderListP2[0].type;
            }
            _level0.ok_snd.start();
            initFaceName();
            order2P_1.gotoAndStop("num1");
            order2P_2.gotoAndStop("num2");
            order2P_3.gotoAndStop("num3");
         }
         if(Key.isDown(_level0.p2) && _level0.orderNum_p2 == 0)
         {
            if(orderKey.p2 == true)
            {
               return undefined;
            }
            orderKey.p2 = true;
            _level0.orderNum_p2++;
            _level0.charSelect_P2 = _level0.selectOrderListP2[2].name;
            _level0.mode_role_P2 = _level0.selectOrderListP2[2].type;
            _level0.charSelect_P23 = _level0.selectOrderListP2[0].name;
            _level0.mode_role_P23 = _level0.selectOrderListP2[0].type;
            _level0.firstNum2P = 3;
            _level0.ok_snd.start();
         }
         if(Key.isDown(_level0.p2) && _level0.orderNum_p2 == 1)
         {
            if(orderKey.p2 == true)
            {
               return undefined;
            }
            orderKey.p2 = true;
            _level0.orderNum_p2++;
            _level0.charSelect_P22 = _level0.selectOrderListP2[2].name;
            _level0.mode_role_P22 = _level0.selectOrderListP2[2].type;
            if(_level0.firstNum2P == 1)
            {
               _level0.charSelect_P23 = _level0.selectOrderListP2[1].name;
               _level0.mode_role_P23 = _level0.selectOrderListP2[1].type;
            }
            else if(_level0.firstNum2P == 2)
            {
               _level0.charSelect_P23 = _level0.selectOrderListP2[0].name;
               _level0.mode_role_P23 = _level0.selectOrderListP2[0].type;
            }
            _level0.ok_snd.start();
            initFaceName();
            order2P_1.gotoAndStop("num1");
            order2P_2.gotoAndStop("num2");
            order2P_3.gotoAndStop("num3");
         }
      };
   }
   else
   {
      _level0.orderMax = 2;
      if(_level0.player_type == "1PVSCOM" && !(_level0.stageID == 3 || _level0.stageID == 7 || _level0.stageID == 8))
      {
         orderKey.p_l2 = true;
         orderKey.k_l2 = true;
         setTimeout(function()
         {
            if(order_rate > 0.5)
            {
               _level0.charSelect_P2 = _level0.selectOrderListP2[1].name;
               _level0.mode_role_P2 = _level0.selectOrderListP2[1].type;
               _level0.charSelect_P22 = _level0.selectOrderListP2[0].name;
               _level0.mode_role_P22 = _level0.selectOrderListP2[0].type;
            }
            order2P_1.gotoAndStop("num1");
            order2P_2.gotoAndStop("num2");
            _level0.ok_snd.start();
            initFaceName();
            _level0.orderNum_p2 = 1;
         }
         ,750);
      }
      this.onEnterFrame = function()
      {
         if(_level0.orderMax == _level0.orderNum_p1 + _level0.orderNum_p2)
         {
            return undefined;
         }
         if(Key.isDown(_level0.p_l) && _level0.orderNum_p1 < 1)
         {
            if(orderKey.p_l == true)
            {
               return undefined;
            }
            orderKey.p_l = true;
            _level0.orderNum_p1++;
            order1P_1.gotoAndStop("num1");
            order1P_2.gotoAndStop("num2");
            _level0.ok_snd.start();
         }
         if(Key.isDown(_level0.k_l) && _level0.orderNum_p1 < 1)
         {
            if(orderKey.k_l == true)
            {
               return undefined;
            }
            orderKey.k_l = true;
            _level0.orderNum_p1++;
            _level0.charSelect_P1 = _level0.selectOrderListP1[1].name;
            _level0.mode_role_P1 = _level0.selectOrderListP1[1].type;
            _level0.charSelect_P12 = _level0.selectOrderListP1[0].name;
            _level0.mode_role_P12 = _level0.selectOrderListP1[0].type;
            order1P_1.gotoAndStop("num1");
            order1P_2.gotoAndStop("num2");
            _level0.ok_snd.start();
            initFaceName();
         }
         if(Key.isDown(_level0.p_l2) && _level0.orderNum_p2 < 1)
         {
            if(orderKey.p_l2 == true)
            {
               return undefined;
            }
            orderKey.p_l2 = true;
            _level0.orderNum_p2++;
            order2P_1.gotoAndStop("num1");
            order2P_2.gotoAndStop("num2");
            _level0.ok_snd.start();
         }
         if(Key.isDown(_level0.k_l2) && _level0.orderNum_p2 < 1)
         {
            if(orderKey.k_l2 == true)
            {
               return undefined;
            }
            orderKey.k_l2 = true;
            _level0.orderNum_p2++;
            _level0.charSelect_P2 = _level0.selectOrderListP2[1].name;
            _level0.mode_role_P2 = _level0.selectOrderListP2[1].type;
            _level0.charSelect_P22 = _level0.selectOrderListP2[0].name;
            _level0.mode_role_P22 = _level0.selectOrderListP2[0].type;
            order2P_1.gotoAndStop("num1");
            order2P_2.gotoAndStop("num2");
            _level0.ok_snd.start();
            initFaceName();
         }
      };
   }
}
