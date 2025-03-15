{
  programs.git = {
    enable = true;

    userName = "Jhuan-Nycolas";
    userEmail = "jhuan2024@hotmail.com";
    extraConfig = {
      credential.helper = "store";
    };
  };
}
