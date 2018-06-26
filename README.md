Three simple utilities:

### `catalog`

Make a catalog of files in a given folder, and all sub-folders, recording the
SHA256 for each file. Record it all in an output file.

### `backup`

Take a catalog file using the `catalog` command, and backup the files in that
catalog to a destination folder.

Backed up files are de-duplicated, and compressed using GZip.

Running the exact same `backup` command, with the same backup destination as a
previous backup will result is an incremental backup. If nothing has changed,
then the incremental backup should be relatively quick.

### `restore`

Take a catalog file generated using the `catalog` command, and restore the files
in that catalog to a destination folder.

Restored files are decrypted, decompressed using GZip, and finally
re-duplicated.

## WARNING

!!! It's critical that you keep your catalog files !!! You cannot restore the
data without them, and what good is a backup without the ability to restore?

## Example usage

```shell
catalog music/ music.catalog
backup music.catalog backups/
restore music.catalog backups/ restored-files/
```

The above commands will do the following:

* Catalog all the files and sub-folders/files in `music/`, storing the resulting
  catalog in `music.catalog`
* Create backups of files listed in `music.catalog`, storing the de-duplicated,
  compressed files in `backups/`
* Restore the files named in `music.catalog` to the `restored-files/` folder.

Running these three steps should produce an exact copy of `music/` in
`restored-files/`

