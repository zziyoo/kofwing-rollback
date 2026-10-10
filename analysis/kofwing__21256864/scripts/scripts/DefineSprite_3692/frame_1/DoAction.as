stop();
_visible = false;
var _list = [{label:"玩家控制",data:"control"},{label:"前进",data:"walk_f"},{label:"后退",data:"walk_b"},{label:"前沖",data:"dash_f"},{label:"疾退",data:"dash_b"},{label:"蹲下",data:"squat"},{label:"跳跃",data:"jump"},{label:"前跳",data:"jump_f"},{label:"后跳",data:"jump_b"},{label:"向前闪避",data:"roll_f"},{label:"向后闪避",data:"roll_b"},{label:"防禦",data:"hold_u"},{label:"蹲下防禦",data:"hold_d"},{label:"轻拳",data:"punch_l"},{label:"轻腿",data:"kick_l"},{label:"重拳",data:"punch"},{label:"重腿",data:"kick"},{label:"蹲下轻拳",data:"squatPunch_l"},{label:"蹲下轻腿",data:"squatKick_l"},{label:"蹲下重拳",data:"squatPunch"},{label:"蹲下重腿",data:"squatKick"},{label:"重击",data:"heavyHit"}];
var mc = [{label:"力量",data:"power"},{label:"攻击",data:"attack"},{label:"防御",data:"defend"}];
if(_root.lan == "en")
{
   nameP1.text = "1P Fixed action setting";
   nameP2.text = "2P Fixed action setting";
   name1.text = "Infinite Power";
   name2.text = "Infinite Power";
   wq1.label = "ON";
   ww1.label = "off";
   wq2.label = "ON";
   ww2.label = "off";
   btn.label = "Confirm";
   btn2.label = "Confirm";
   var mc = [{label:"power",data:"power"},{label:"attack",data:"attack"},{label:"defend",data:"defend"}];
   _list = [{label:"Control by player",data:"control"},{label:"Walk forward",data:"walk_f"},{label:"Walk backward",data:"walk_b"},{label:"Run",data:"dash_f"},{label:"Step back",data:"dash_b"},{label:"Squat",data:"squat"},{label:"Jump",data:"jump"},{label:"Jump forward",data:"jump_f"},{label:"Jump backward",data:"jump_b"},{label:"Dodge forward",data:"roll_f"},{label:"Dodge backward",data:"roll_b"},{label:"Defend",data:"hold_u"},{label:"Squat defend",data:"hold_d"},{label:"Light punch",data:"punch_l"},{label:"Light kick",data:"kick_l"},{label:"Punch",data:"punch"},{label:"Kick",data:"kick"},{label:"Squat light punch",data:"squatPunch_l"},{label:"Squat light kick",data:"squatKick_l"},{label:"Squat punch",data:"squatPunch"},{label:"Squat kick",data:"squatKick"},{label:"Heavy hit",data:"heavyHit"}];
}
cb.dataProvider = _list;
cb2.dataProvider = _list;
cc1.dataProvider = mc;
cc2.dataProvider = mc;
btn.onRelease = function()
{
   _root.actionSet(_root.P1_role,cb.selectedItem.data);
   stage.setFocus();
};
btn2.onRelease = function()
{
   _root.actionSet(_root.P2_role,cb2.selectedItem.data);
   stage.setFocus();
};
wq1.onRelease = function()
{
   _root.rePower(_root.P1_role);
   _root.powerMAX(_root.P1_role,cc1.selectedItem.data);
   stage.setFocus();
};
wq2.onRelease = function()
{
   _root.rePower(_root.P1_role);
   _root.powerMAX(_root.P2_role,cc2.selectedItem.data);
   stage.setFocus();
};
ww1.onRelease = function()
{
   _root.rePower(_root.P1_role);
   stage.setFocus();
};
ww2.onRelease = function()
{
   _root.rePower(_root.P2_role);
   stage.setFocus();
};
