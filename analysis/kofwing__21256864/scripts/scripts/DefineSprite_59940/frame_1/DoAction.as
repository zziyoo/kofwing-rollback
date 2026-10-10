stop();
if(_level0.moreVs == true)
{
   var winner;
   if(_root.wface == 1)
   {
      if(_level0.loseTimes_P1 == 2)
      {
         winner = _level0.charSelect_P1;
         if(_level0.charSelect_P1 == "Iori" && _level0.mode_role_P1 == 3)
         {
            winner = "Iori3";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P1 == "Ash" && _level0.mode_role_P1 == 2)
         {
            winner = "Ash2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P1 == "KyoW" && _level0.mode_role_P1 == 2)
         {
            winner = "KyoW2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P1 == "Zero" && _level0.mode_role_P1 == 2)
         {
            winner = "CZero";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P1 == "Orochi" && _level0.mode_role_P1 == 2)
         {
            winner = "Orochi2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P1 == "Krizalid" && _level0.mode_role_P1 == 2)
         {
            winner = "Krizalid2";
            gotoAndStop(winner);
            return undefined;
         }
      }
      else
      {
         winner = _level0.charSelect_P13;
         if(_level0.charSelect_P13 == "Iori" && _level0.mode_role_P13 == 3)
         {
            winner = "Iori3";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P13 == "Ash" && _level0.mode_role_P13 == 2)
         {
            winner = "Ash2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P13 == "KyoW" && _level0.mode_role_P13 == 2)
         {
            winner = "KyoW2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P13 == "Zero" && _level0.mode_role_P13 == 2)
         {
            winner = "CZero";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P13 == "Orochi" && _level0.mode_role_P13 == 2)
         {
            winner = "Orochi2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P13 == "Krizalid" && _level0.mode_role_P13 == 2)
         {
            winner = "Krizalid2";
            gotoAndStop(winner);
            return undefined;
         }
      }
   }
   else if(_root.wface == 2)
   {
      if(_level0.loseTimes_P2 == 2)
      {
         winner = _level0.charSelect_P2;
         if(_level0.charSelect_P2 == "Iori" && _level0.mode_role_P2 == 3)
         {
            winner = "Iori3";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P2 == "Ash" && _level0.mode_role_P2 == 2)
         {
            winner = "Ash2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P2 == "KyoW" && _level0.mode_role_P2 == 2)
         {
            winner = "KyoW2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P2 == "Zero" && _level0.mode_role_P2 == 2)
         {
            winner = "CZero";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P2 == "Orochi" && _level0.mode_role_P2 == 2)
         {
            winner = "Orochi2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P2 == "Krizalid" && _level0.mode_role_P2 == 2)
         {
            winner = "Krizalid2";
            gotoAndStop(winner);
            return undefined;
         }
      }
      else
      {
         winner = _level0.charSelect_P23;
         if(_level0.charSelect_P23 == "Iori" && _level0.mode_role_P23 == 3)
         {
            winner = "Iori3";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P23 == "Ash" && _level0.mode_role_P23 == 2)
         {
            winner = "Ash2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P23 == "KyoW" && _level0.mode_role_P23 == 2)
         {
            winner = "KyoW2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P23 == "Zero" && _level0.mode_role_P23 == 2)
         {
            winner = "CZero";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P23 == "Orochi" && _level0.mode_role_P23 == 2)
         {
            winner = "Orochi2";
            gotoAndStop(winner);
            return undefined;
         }
         if(_level0.charSelect_P23 == "Krizalid" && _level0.mode_role_P23 == 2)
         {
            winner = "Krizalid2";
            gotoAndStop(winner);
            return undefined;
         }
      }
   }
   gotoAndStop(winner);
}
