function showAd()
{
   if(isEn)
   {
      FWAd_AS2.showAd({noShowLogo:true,noShowForbidden:true,container:this,x:0,y:0,wid:660,hei:485,id:"flashwing-en-1",adType:"loading",onClickCloseBtn:fwAd_onClickCloseBtn});
   }
   else
   {
      FWAd_AS2.showAd({noShowLogo:true,noShowForbidden:true,container:this,x:0,y:0,wid:660,hei:485,id:"flashwing-cxp-1",adType:"loading",onClickCloseBtn:fwAd_onClickCloseBtn});
   }
   adShowedNum++;
}
function fwAd_onClickCloseBtn()
{
   play();
}
var adShowedNum = 0;
