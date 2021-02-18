#!/bin/sh

OPK_NAME=supertux-retrofw.opk
echo ${OPK_NAME}

# create default.retrofw.desktop
cat > default.retrofw.desktop <<EOF
[Desktop Entry]
Name=Supertux
Comment=Jump'n run game
Exec=supertux
Terminal=false
Type=Application
StartupNotify=true
Icon=supertux
Categories=games;
EOF

# create opk
FLIST="data supertux supertux.png default.retrofw.desktop"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -no-xattrs -noappend

cat default.retrofw.desktop
rm -f default.retrofw.desktop
