class ApxAssets {

  ApxAssets._();


  static const _baseImage = "assets/";
  static const _baseSvg = "assets/";

  static String _getImagePath (String pathName) {
    pathName = "$pathName.png";
    return _baseImage + pathName;
  }

  static String _getSvgPath (String pathName) {
    pathName = "$pathName.svg";
    return _baseSvg + pathName;
  }


 /*-------------------- NNGS ------------------------- */
  
  static String onBoardingImg1 = _getImagePath("images/pngs/img1");
   static String onBoardingImg2 = _getImagePath("images/pngs/img2");
   static String thumbs = _getImagePath("images/pngs/thumb");

  /*-------------------- SVGS ------------------------- */

  static String apxLogo = _getSvgPath("images/svgs/Logo");
  static String google = _getSvgPath("images/svgs/google");
   static String apple = _getSvgPath("images/svgs/apple");
   static String lock = _getSvgPath("images/svgs/lock");
   static String person = _getSvgPath("images/svgs/person");
   
}
