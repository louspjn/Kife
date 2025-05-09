import
  std/terminal,
  ../assets/logos

func getLogo*(distroId: string): tuple =
  const
    coloredLogos: array[16, tuple] = [
      (fgBlue, nitchLogo),
      (fgBlue, archLogo),
      (fgRed, ubuntuLogo),
      (fgRed, debianLogo),
      (fgBlue, fedoraLogo),
      (fgGreen, mintLogo),
      (fgBlue, zorinLogo),
      (fgCyan, poposLogo),
      (fgGreen, manjaroLogo),
      (fgGreen, opensuseLogo),
      (fgBlue, slackwareLogo),
      (fgYellow, centosLogo),
      (fgRed, redhatLogo),
      (fgMagenta, gentooLogo),
      (fgMagenta, endeavourosLogo),
      (fgBlue, artixLogo)
    ]

  case distroId:
  of "arch":
    result = coloredLogos[0]

  of "ubuntu":
    result = coloredLogos[0]

  of "debian":
    result = coloredLogos[0]

  of "fedora":
    result = coloredLogos[0]

  of "linuxmint":
    result = coloredLogos[0]

  of "Zorin OS":
    result = coloredLogos[0]

  of "pop":
    result = coloredLogos[0]

  of "manjaro":
    result = coloredLogos[0]

  of "opensuse":
    result = coloredLogos[0]

  of "slackware":
    result = coloredLogos[0]

  of "centos":
    result = coloredLogos[0]

  of "redhat":
    result = coloredLogos[0]

  of "gentoo":
    result = coloredLogos[0]

  of "endeavouros":
    result = coloredLogos[0]

  of "artix":
    result = coloredLogos[0]

  else:
    result = coloredLogos[0]
