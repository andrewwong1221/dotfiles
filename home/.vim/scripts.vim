" Perforce filetype
if did_filetype() " filetype already set..
  finish
endif

if getline(1) =~ '^# A Perforce '
  setfiletype p4
endif
