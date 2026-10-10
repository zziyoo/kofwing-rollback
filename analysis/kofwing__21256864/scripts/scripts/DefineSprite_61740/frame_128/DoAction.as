stop();
oppId.restrict = "a-z 0-9";
var _id;
var send_lc;
var receive_lc;
send_lc = new LocalConnection();
receive_lc = new LocalConnection();
send_lc.allowDomain("*");
receive_lc.allowDomain("*");
receive_lc.client = this;
receive_lc.connect("kofwing_bridge2");
receive_lc.receiveMyID = function(myId)
{
   _id = myId;
   roleId.text = _id;
   hint_btn.label = "获取成功!";
};
receive_lc.startMatch = function()
{
   play();
};
hint_btn.onRelease = function()
{
   hint_btn.label = "正在获取你的RTMFP id...请稍等...";
   send_lc.send("kofwing_bridge","requestId");
};
btnHost.onRelease = function()
{
   send_lc.send("kofwing_bridge","hostGame",_id);
};
btnConnect.onRelease = function()
{
   if(oppId.text == "")
   {
      return undefined;
   }
   send_lc.send("kofwing_bridge","connectById",oppId.text);
};
