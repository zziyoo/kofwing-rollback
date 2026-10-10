function saveLang(bool)
{
   setting.data.lan_set = bool;
   setting.flush();
   lan_set = bool;
   if(bool)
   {
      lan = "cn";
   }
   else
   {
      lan = "en";
   }
}
function getLang()
{
   return lan_set;
}
function getLan()
{
   if(System.capabilities.language == "zh-CN")
   {
      lan = "cn";
   }
   else if(System.capabilities.language == "zh-TW")
   {
      lan = "cn2";
   }
   else
   {
      lan = "en";
   }
}
function linkToHelp(anchor)
{
   if(anchor == undefined)
   {
      anchor = "";
   }
   if(!onLine)
   {
      if(lan == "en")
      {
         getURL("readme.pdf#" + anchor,"_blank");
      }
      else
      {
         getURL("readme.pdf#" + anchor,"_blank");
      }
   }
   else if(lan == "en")
   {
      getURL("http://flashwing.kilu.de/help_en.html#" + anchor,"_blank");
   }
   else
   {
      getURL("http://flashwing.kilu.de/help.html#" + anchor,"_blank");
   }
}
function showSkillTable()
{
   if(lan == "en")
   {
      getURL("data/skillTable.html", "_blank");
   }
   else
   {
      getURL("data/skillTable.html", "_blank");
   }
}
function gotoWeb()
{
   getURL("data/gotoWeb.html", "_blank");
}
function gotoQQGroup()
{
   getURL("data/gotoQQGroup.html", "_blank");
}
function gotoTBWeb()
{
   getURL("data/gotoTBWeb.html", "_blank");
}
function gotoWeb_kof()
{
   getURL("http://kof.flashwing.net", "_blank");
}
function gotoWeb_en()
{
   getURL("http://en.flashwing.net", "_blank");
}
function getAdPath()
{
   var _loc1_;
   if(System.capabilities.language == "zh-CN")
   {
      _loc1_ = "http://gamecfg.flashwing.net";
   }
   else if(System.capabilities.language == "zh-TW")
   {
      _loc1_ = "http://gamecfg.flashwing.net";
   }
   else
   {
      _loc1_ = "http://gamecfg.flashwing.net";
   }
   return _loc1_;
}
var onLine = false;
var testVer = false;
var isLoadRole = true;
var isLoadMusic = true;
var isLoadStage = true;
var netPlay = false;
var netPlay_bool = false;
var trialVer = false;
var wingUrl = "http://www.flashwing.xyz";
var wingRankPort = "57983";
var ifShowUpdate = true;
var setting = SharedObject.getLocal("kofwingEX1.2test");
if(!setting.data.helpShowed)
{
   setting.data.helpShowed = new Object();
}
var lan;
var lan_set;
if(setting.data.lan_set == undefined)
{
   getLan();
   if(lan == "cn" || lan == "cn2")
   {
      lan_set = true;
   }
   else
   {
      lan_set = false;
   }
   saveLang(lan_set);
}
else
{
   lan_set = setting.data.lan_set;
   saveLang(lan_set);
}
stage.showMenu = false;
var game = "kof_ex_v1.2";
System.security.allowDomain("*.flashwing.net");
var quality1 = "HIGH";
var quality2 = "LOW";
_quality = quality1;
fscommand("showmenu",true);
myContextMenu = new ContextMenu();
myContextMenu.hideBuiltInItems();
if(lan == "cn")
{
   myContextMenu.customItems.push(new ContextMenuItem("闪翼拳皇专题网站",gotoWeb_kof),new ContextMenuItem("闪翼工作室网站",gotoWeb),new ContextMenuItem("闪翼论坛",gotoForum));
}
else
{
   myContextMenu.customItems.push(new ContextMenuItem("The King Of Fighters Wing Website",gotoWeb_kof),new ContextMenuItem("Flashwing Studio Website",gotoWeb),new ContextMenuItem("Flashwing Forum",gotoForum),new ContextMenuItem("Flashwing Facebook page",gotoFbPage));
}
this.menu = myContextMenu;
