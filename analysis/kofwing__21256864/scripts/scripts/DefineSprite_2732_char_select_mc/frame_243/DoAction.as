stop();
var owner = this;
var send_lc2 = new LocalConnection();
send_lc2.allowDomain("*");
var receive_lc2 = new LocalConnection();
receive_lc2.allowDomain("*");
receive_lc2.client = this;
receive_lc2.receiveOppMode = function()
{
   owner.play();
};
receive_lc2.connect("kofwing_bridge2");
send_lc2.send("kofwing_bridge","sendMyMode",true,"mode");
