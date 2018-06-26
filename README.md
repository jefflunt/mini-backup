Two simple utilities:

### `backup source-folder destination-folder`

Make a de-duplicated, compressed backup of the entire folder structure in
`source-folder` in `destination-folder`. Inside of `destination-folder` you will
find a folder called `catalogs` where a catalog of what was backed up will be
recorded. YOU NEED THIS CATALOG IN ORDER TO RESTORE.

### `restore catalog-file destination-folder`

Take a catalog file generated using the `backup` command, and restore the files
in that catalog to a `destination-folder.

## WARNING

!!! It's critical that you keep your catalog files !!! You cannot restore the
data without them, and what good is a backup without the ability to restore?

## Example usage

```shell
catalog music/ music.catalog
backup music/ backups/
restore 20180625.120100.music.catalog music-restore/
```

The above commands will do the following:

* Catalog all the files and sub-folders/files in `music/`, storing the resulting
  catalog in `music.catalog`
* Create backups of files listed in `music.catalog`, storing the de-duplicated,
  compressed files in `backups/`
* Restore the files named in `music.catalog` to the `restored-files/` folder.

Running these three steps should produce an exact copy of `music/` in
`restored-files/`

