-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

local awesome = awesome

Debian_menu = {}

Debian_menu["Debian_Aide"] = {
	{"Xman","xman"},
}
Debian_menu["Debian_Applications_Accessibilité"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Applications_Dessin_et_image"] = {
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Applications_Éditeurs"] = {
	{"Xedit","xedit"},
}
Debian_menu["Debian_Applications_Gestion_de_données"] = {
	{"Innotop", "x-terminal-emulator -e ".."/usr/bin/innotop"},
}
Debian_menu["Debian_Applications_Interpréteurs_de_commandes"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
	{"Zsh", "x-terminal-emulator -e ".."/bin/zsh"},
}
Debian_menu["Debian_Applications_Lecteurs"] = {
	{"Xditview","xditview"},
}
Debian_menu["Debian_Applications_Programmation"] = {
	{"Tclsh8.6", "x-terminal-emulator -e ".."/usr/bin/tclsh8.6"},
}
Debian_menu["Debian_Applications_Réseau_Communication"] = {
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet.netkit"},
	{"Xbiff","xbiff"},
}
Debian_menu["Debian_Applications_Réseau_Navigateurs_web"] = {
	{"Google Chrome","/opt/google/chrome/google-chrome","/opt/google/chrome/product_logo_32.xpm"},
}
Debian_menu["Debian_Applications_Réseau_Transfert_de_fichiers"] = {
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Applications_Réseau"] = {
	{ "Communication", Debian_menu["Debian_Applications_Réseau_Communication"] },
	{ "Navigateurs web", Debian_menu["Debian_Applications_Réseau_Navigateurs_web"] },
	{ "Transfert de fichiers", Debian_menu["Debian_Applications_Réseau_Transfert_de_fichiers"] },
}
Debian_menu["Debian_Applications_Sciences_Mathématiques"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"sympy (Python3)", "x-terminal-emulator -e ".."python3 /usr/bin/isympy",},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Applications_Sciences"] = {
	{ "Mathématiques", Debian_menu["Debian_Applications_Sciences_Mathématiques"] },
}
Debian_menu["Debian_Applications_Système_Administration"] = {
	{"Editres","editres"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Applications_Système_Matériel"] = {
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Applications_Système_Surveillance"] = {
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Applications_Système"] = {
	{ "Administration", Debian_menu["Debian_Applications_Système_Administration"] },
	{ "Matériel", Debian_menu["Debian_Applications_Système_Matériel"] },
	{ "Surveillance", Debian_menu["Debian_Applications_Système_Surveillance"] },
}
Debian_menu["Debian_Applications"] = {
	{ "Accessibilité", Debian_menu["Debian_Applications_Accessibilité"] },
	{ "Dessin et image", Debian_menu["Debian_Applications_Dessin_et_image"] },
	{ "Éditeurs", Debian_menu["Debian_Applications_Éditeurs"] },
	{ "Gestion de données", Debian_menu["Debian_Applications_Gestion_de_données"] },
	{ "Interpréteurs de commandes", Debian_menu["Debian_Applications_Interpréteurs_de_commandes"] },
	{ "Lecteurs", Debian_menu["Debian_Applications_Lecteurs"] },
	{ "Programmation", Debian_menu["Debian_Applications_Programmation"] },
	{ "Réseau", Debian_menu["Debian_Applications_Réseau"] },
	{ "Sciences", Debian_menu["Debian_Applications_Sciences"] },
	{ "Système", Debian_menu["Debian_Applications_Système"] },
}
Debian_menu["Debian_Gestionnaires_de_fenêtres"] = {
	{"awesome",function () awesome.exec("/usr/bin/awesome") end,"/usr/share/pixmaps/awesome.xpm"},
	{"Bspwm",function () awesome.exec("/usr/bin/bspwm") end},
}
Debian_menu["Debian_Jeux_Jouets"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Jeux"] = {
	{ "Jouets", Debian_menu["Debian_Jeux_Jouets"] },
}
Debian_menu["Debian"] = {
	{ "Aide", Debian_menu["Debian_Aide"] },
	{ "Applications", Debian_menu["Debian_Applications"] },
	{ "Gestionnaires de fenêtres", Debian_menu["Debian_Gestionnaires_de_fenêtres"] },
	{ "Jeux", Debian_menu["Debian_Jeux"] },
}

debian = { menu = { Debian_menu = Debian_menu } }
return debian