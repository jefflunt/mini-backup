Three simple utilities:

`catalog`

Make a catalog of files in a given folder, and all sub-folders, recording the
SHA256 for each file. Record it all in a file.

`backup`

Take a catalog file generated using the `catalog` command, and backup the files
in that catalog to a destination folder.

Backed up files are de-duplicated, compressed using GZip, and finally encrypted
using GnuGP.

`restore`

Take a catalog file generated using the `catalog` command, and restore the files
in that catalog to a destination folder.

Restored files are decrypted, decompressed using GZip, and finally
re-duplicated.
