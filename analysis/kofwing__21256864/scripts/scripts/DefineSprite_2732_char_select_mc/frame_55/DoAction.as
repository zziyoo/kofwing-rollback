stop();
var owner = this;
var selectMax = 2;
var keyP1 = {u:_level0.key_P1[0].u,d:_level0.key_P1[0].d,b:_level0.key_P1[0].b,f:_level0.key_P1[0].f,p:_level0.key_P1[0].p,k:_level0.key_P1[0].k,p_l:_level0.key_P1[0].p_l,k_l:_level0.key_P1[0].k_l,s:_level0.key_P1[0].s,s2:_level0.key_P1[0].s2,h:_level0.key_P1[0].h};
var keyP2 = {u:_level0.key_P2[0].u,d:_level0.key_P2[0].d,b:_level0.key_P2[0].b,f:_level0.key_P2[0].f,p:_level0.key_P2[0].p,k:_level0.key_P2[0].k,p_l:_level0.key_P2[0].p_l,k_l:_level0.key_P2[0].k_l,s:_level0.key_P2[0].s,s2:_level0.key_P2[0].s2,h:_level0.key_P2[0].h};
if(_level0.P1_type == "cpu")
{
   select_mc.player.init(keyP1,"a4",face_p1,name_mc1,this,mode_p1,fromTxt_mc1,"p1");
}
else
{
   select_mc.player.init(keyP1,"b",face_p1,name_mc1,this,mode_p1,fromTxt_mc1,"p1");
}
if(_root.netPlay_bool)
{
   mask_netplay._visible = true;
   select_mc2.player.init(null,"k",face_p2,name_mc2,this,mode_p2,fromTxt_mc2,"p2");
}
else if(_level0.player_type == "1PVS2P")
{
   select_mc2.player.init(keyP2,"k",face_p2,name_mc2,this,mode_p2,fromTxt_mc2,"p2");
}
else if(_level0.P2_type == "cpu")
{
   select_mc2.player.init(null,"a4",face_p2,name_mc2,this,mode_p2,fromTxt_mc2,"p2");
}
else
{
   select_mc2.player.init(null,"k",face_p2,name_mc2,this,mode_p2,fromTxt_mc2,"p2");
}
var oppRole;
var char_p1;
var char_p2;
var oppSelected = false;
var send_lc;
var receive_lc;
if(_root.netPlay)
{
   send_lc = new LocalConnection();
   receive_lc = new LocalConnection();
   send_lc.allowDomain("*");
   receive_lc.allowDomain("*");
   receive_lc.client = this;
   receive_lc.connect("kofwing_bridge2");
}
receive_lc.receiveOppRole = function(_oppRole)
{
   oppSelected = true;
   oppRole = _oppRole;
   char_p2 = _oppRole;
   select_mc2.player.selectRole = oppRole;
   mask_netplay.txt.text = oppRole.toString();
   select_mc2.player.showFace(char_p2 + "1");
   select_mc2.player.showName(char_p2);
   if(owner.oppSelected && select_mc.player.selectRole != undefined && _root.netPlay)
   {
      owner.gotoAndPlay("mode2");
   }
};
var selectNum = 0;
select_mc.player.selectOK_char = function()
{
   owner.selectNum++;
   if(_root.netPlay)
   {
      send_lc.send("kofwing_bridge","sendMyRole",select_mc.player.selectRole,"role");
   }
   if(owner.selectNum == selectMax)
   {
      owner.gotoAndPlay("mode2");
      send_lc.close();
      receive_lc.close();
   }
   if(_level0.player_type == "trainning" || _level0.player_type == "COMVSCOM" || _level0.player_type == "vs")
   {
      if(_level0.player_type == "1PVS2P")
      {
         owner.select_mc2.player.init(keyP2,"k",face_p2,name_mc2,this,mode_p2,fromTxt_mc2,"p2");
      }
      else if(_level0.P2_type == "cpu")
      {
         owner.select_mc2.player.init(keyP1,"a4",face_p2,name_mc2,this,mode_p2,fromTxt_mc2,"p2");
      }
      else
      {
         owner.select_mc2.player.init(keyP1,"k",face_p2,name_mc2,this,mode_p2,fromTxt_mc2,"p2");
      }
   }
};
select_mc2.player.selectOK_char = function()
{
   owner.selectNum++;
   if(owner.selectNum == selectMax)
   {
      owner.gotoAndPlay("mode2");
   }
};
if(_level0.player_type == "COMVSCOM")
{
   _level0.canSelect = false;
}
