if(loginData.role == "all")
{
   var vsType = loginData.vsType;
   loginData = new LoadVars();
   loginData.vsType = vsType;
}
loginData.sendAndLoad(_level0.wingUrl + ":" + _level0.wingRankPort + "/rankAll",loginData,"post");
loginData.onLoad = function(success)
{
   if(success)
   {
      for(log in loginData)
      {
         _obj = JSON.decode(log);
         return undefined;
         break;
      }
   }
};
