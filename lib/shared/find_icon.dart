String findIcon(String condition) {
  switch (condition) {
    case "clear_day":
      return "assets/images/encolarado.svg";
    case "cloud":
      return "assets/images/nublado.svg";
      case "storm":
      case "rain":
      return "assets/images/chuva_forte.svg";
      case "cloudLy_day":
      return "assets/images/sol_ebtre_nuvens.svg";
      default:
      return "assets/images/chuva_fraca.svg";
      }
}
